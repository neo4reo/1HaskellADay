module Y2017.M03.D02.Exercise where

-- below import available via 1HaskellADay git repository

import Rosalind.Types

{--
My problem is that I'm stupid.

No, really. I keep creating these generate-and-test algorithms that work fine
in a microcosm, but as soon as I open up the throttle everything goes to
combinatorial-hell. I've done this over and over and over again.

I've even done permutations of doing generate-and-test: over and over again!

SO!

For today's haskell problem, we're just going to toss the idea of finding
subsequences efficiently, because that's way too generate-and-test-y (and, yes,
I'm feeling quite testy right now), and, instead, since we know we progress
through each list, anyway, we'll just use those progressions simultaneously to
arrive at our solution at O(n+m)-time in the worst case scenario.

YAY! Champaign for everyone!

... I mean: of course we have to solve the problem, but still, I have a good
feeling about this approach (because it's not generate-and-test-y)

So, today's Haskell problem:

Given two lists, as and bs, advance through each list to the next same element
in both lists covering the least distance possible in each list at each step.

Oh, and accumulate the matching elements as you go, of course!
--}

minDistanceTraversals :: Eq a => [a] -> [a] -> [[a]]
minDistanceTraversals as bs = undefined

{--
Of course, that's the top-down view of our approach. What do we need to do to
arrive at the solution? Well, we need an automaton to crawl forward in each 
list, recording the distance it went, then we need to find a way to minimize
the combined distance the automata travel through these lists ...

... is this starting to sound a lot like graph theory?
--}

distance :: Eq a => a -> [a] -> Maybe (Int, [a])
distance elt list = undefined

{--
>>> distance 1 [1..10]
Just (0, [2..10])

>>> distance 11 [1..10]
Nothing

>>> distance 5 [1..10]
Just (4,[6,7,8,9,10])

So we know, now the distance from head as to the same element in bs:

distance (head as) bs

And we know the same for head bs to the same element in as:

distance (head bs) as

So we just take the min of those distances and proceed?

Not so fast there, cowboy! What if we have:

as = [5, 1, 12, 17, ..]
bs = [7, 1, 13, 15, ..]

Then those distances are deceiving, because we have an even shorter path:

head (tail as) == head (tail bs)

How do we cover this possibility (that a distance in depth is shorter than
a 'surface' distance)?

We need to find the min of the distances in depth going only as far into the
lists as the min of the surface distances, right?

What's the algorithm for that?

Given: index-depth == 0
       min-surface-distance = d

1. add 2 to the index-depth as we take the tails of both lists
2. compute the distances there (factoring in the index-depth)
3. decrement the min-surface-distance by 2
4. lather. rinse. repeat until min-surface-distance < 1

Then find the 'minimumest' distance of all those distances.

minimumest means not just minimum, but minimum of the minimums, or WAY minimum.
--}

minimumest :: [a] -> [a] -> Maybe (a, ([a], [a]))
minimumest as bs = undefined

-- given two lists as and bs, find the next element that is shared by both
-- lists using the least amount of steps to get to that next shared element.

-- so, for the lists:

rosalind23, rosalind64 :: DNAStrand
rosalind23 = "AACCTTGG"
rosalind64 = "ACACTGTGA"

-- What is the 'first' minimumest? The next minimumest (from the resulting
-- returned sublists)? The next-next minimumest ... How many minimumest values
-- can you get from the above two rosalind lists until you get Nothing?
