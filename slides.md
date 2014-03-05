% Intro to Haskell<brchr>(for Erlangers)
% Bob Ippolito
% March 7, 2014

# Who am I?

- Not classically trained in CS
- Erlang user since 2006 (Mochi Media, mochiweb, etc.)
- Haskell user since 2012
  (ported [exercism.io](http://exercism.io) curriculum)
- Currently teaching web technologies to teenagers with
  [Mission Bit](http://www.missionbit.com/)
- Doing a bit of advising/investing in startups

# Why learn Haskell?

- I learn a lot of from studying new languages
- Types are supposed to help you write better software
- Good support for parallelism and concurrency
- Will help me understand more CS papers
- Could take a class on it at Facebook

# Haskell's Appeal

- Abstractions can often be used without penalty
- Efficient parallel and concurrent programming
- Type system makes maintenance easier
- Nice syntax (not too heavy or lightweight)
- Fantastic community & ecosystem

# Haskell {#haskell-history}

<!-- http://www.haskell.org/haskellwiki/Haskell_Brooks_Curry -->
<figure>
<img src="img/HaskellBCurry.jpg">
<figcaption>**Haskell** B. Curry</figcaption>
</figure>

# Pre-History

1930s-1950s
~   Lambda Calculus (Turing)
~   Combinatory Calculus (Curry & Feys)
~   LISP (McCarthy)
1960s-1970s
~   Operational (Landin) and Denotational (Strachey) semantics
~   ML (Milner)
~   Lazy FP & Graph Reduction (Turner)
1980s
~   Miranda (Turner)
~   Lazy ML (Augustsson & Johnsson)

# Early History

<!-- http://www.haskell.org/onlinereport/preface-jfp.html
     http://research.microsoft.com/en-us/um/people/simonpj/papers/history-of-haskell/history.pdf
-->
1987
~   More than a dozen non-strict FP languages in use
~   FCPA '87 meeting (Peyton Jones, Hudak, et. al.)
~   Formed FPLang committee
~   Wanted to base language on Miranda, but Turner declined
1988
~   Chose the name Haskell
~   Hudak and Wadler chosen to be editors of the report
1990 (April 1st!)
~   Haskell 1.0 report published (125 pages)

# {#ifip-1992}

<!-- extracted from history.pdf -->
<figure>
<img src="img/ifip-1992.jpg" />
<figcaption>IFIP 1992 Working Group</figcaption>
</figure>

# Evolution

1992
~   Glasgow Haskell Compiler (GHC)
1996
~   Haskell 1.3 - Monadic I/O, seq, strictness annotations
1999
~   Haskell 98 - Commitment to stability
2002
~   Revised Haskell 98  (260 pages)

# Fun Quotes

<!--
http://research.microsoft.com/en-us/um/people/simonpj/papers/haskell-retrospective/HaskellRetrospective-2.pdf
http://research.microsoft.com/en-us/um/people/simonpj/papers/haskell-retrospective/Haskell-Erlang-Jun09.pdf
http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.140.9513&rep=rep1&type=pdf
-->

Tony Hoare (1990s?)
~   I fear that Haskell is doomed to succeed
Simon Peyton Jones (2003)
~   Motto: avoid success at all costs
Haskell: Batteries Included (2008)
~   Avoid "avoiding success"

# Domain

**General Purpose**

* Very effective for parsing and compilation
* Great for DSEL (Domain Specific Embedded Languages)
* Has been popular in academia for some time
* Becoming more popular in industry

# Commercial Use
<!-- http://www.haskell.org/haskellwiki/Haskell_in_industry -->

Biotech
~   [Amgen](http://cufp.galois.com/2008/abstracts.html#BalabanDavid) -
    informatics, simulation
Finance
~   [Credit Suisse](http://cufp.galois.com/2006/abstracts.html#HowardMansell) -
    quantitative modeling
~   [Barclays](http://lambda-the-ultimate.org/node/3331) -
    DSEL for exotic equity derivatives
~   [Deutsche Bank](http://cufp.galois.com/2008/abstracts.html#PolakowJeff) - 
    trading group infrastructure
~   [Tsuru Capital](http://haskell.org/communities/05-2010/html/report.html#sect7.6) -
    trading platform
~   [McGraw-Hill Financial](https://www.youtube.com/watch?v=o3m2NkusI9k) -
    report generation (with [ermine](http://ermine-language.github.io/ermine/))
Semiconductor Design
~   [Bluespec](http://www.slideshare.net/mansu/bluespec-talk) - high-level language for chip design

# Consumer Apps

<!--
Bump:
* https://github.com/MichaelXavier/Angel
* http://devblog.bu.mp/post/40786229350/haskell-at-bump
* https://www.fpcomplete.com/wp-content/uploads/2013/05/Bump%20case%20study.pdf

Silk:
* http://engineering.silk.co/post/31920990633/why-we-use-haskell
* https://www.fpcomplete.com/wp-content/uploads/2013/05/Silk%20case%20study.pdf
-->

[Silk](https://www.silk.co/)
~   "A platform for sharing collections about anything"
[Chordify](http://chordify.net/)
~   "Chord transcription for the masses"
[Bump](https://bu.mp/) (Google, Sep 2013)
~   "Send files, videos, everything!" Mobile + web.
[MailRank](http://www.mailrank.com/) (Facebook, Nov 2011)
~   Email inbox prioritization. Shuttered post-acquisition.
[Bazqux](https://bazqux.com/)
~   "RSS reader that shows comments to posts"

# Commercial Services

<!--
Janrain:
* https://www.fpcomplete.com/wp-content/uploads/2013/05/janrain%20case%20study.pdf
Scrive:
* https://www.fpcomplete.com/wp-content/uploads/Scrive-case-study.pdf
Spaceport:
* https://github.com/sibblingz/spaceport-sp-opensource
Skedge:
* http://www.youtube.com/watch?v=BveDrw9CwEg
* http://cufp.org/sites/all/files/slides/2013/trinkle.pdf
-->
[janrain](http://janrain.com/)
~   User management platform.
[Spaceport](http://spaceport.io/) (Facebook, Aug 2013)
~   Mobile game framework using ActionScript 3
[scrive](http://scrive.com/)
~   E-signing service (nordic market)
[OpenBrain](http://www.openbrain.co.uk/)
~   Computing platform for scientific and business analytics
[skedge.me](http://skedge.me/)
~   Enterprise appointment scheduling

# Compilers

Haskell
~   [GHC](http://www.haskell.org/ghc/),
    [Ajhc](http://ajhc.metasepi.org/),
    [Haste](https://github.com/valderman/haste-compiler),
    [GHCJS](https://github.com/ghcjs/ghcjs)
Dependently typed
~   [Agda](http://wiki.portal.chalmers.se/agda/) - also an interactive proof assistant!
~   [Idris](http://www.idris-lang.org/) - general purpose
Compile to JavaScript
~   [Elm](http://elm-lang.org/) - functional reactive in the browser
~   [Fay](http://fay-lang.org/) - Haskell subset
Imperative
~   [Pugs](http://pugscode.org/) - first Perl 6 implementation

# Standalone Apps

[Pandoc]
~   Markup swiss-army knife (used to make these slides!)
[Darcs](http://darcs.net/)
~   Distributed revision control system (like Git or Mercurial)
[xmonad](http://xmonad.org/)
~   "the tiling window manager that rocks"
[Gitit](http://gitit.net/)
~   Wiki backed by Git, Darcs, or Mercurial
[git-annex](http://git-annex.branchable.com/)
~   Manage large files with git (similar to Dropbox)
[ImplicitCAD](http://www.implicitcad.org/)
~   Programmatic Solid 3D CAD modeler

# Haskell Platform

<h3>Haskell: Batteries Included</h3>

* <http://www.haskell.org/platform>
* GHC compiler and GHCi interpreter
* Robust and stable set of vetted packages
* [Cabal](http://www.haskell.org/cabal/); easily fetch more
  packages from [Hackage](http://hackage.haskell.org/)

# Editor Support

Emacs
~   [ghc-mod] + [HLint]
Vim
~   [hdevtools] +
    [Syntastic](https://github.com/scrooloose/syntastic) + 
    [vim-hdevtools](https://github.com/bitc/vim-hdevtools)
Sublime Text
~   [hdevtools] +
    [SublimeHaskell](https://github.com/SublimeHaskell/SublimeHaskell)
Eclipse
~   [EclipseFP](http://eclipsefp.github.io/) + [HLint]
Web
~   [FP Haskell Center](https://www.fpcomplete.com/business/haskell-center/overview/)

# Haskell Syntax

Types
~   Defines types and typeclasses
~   Constructors and record accessors become values

Values
~   Named bindings
~   Instances of constructors
~   Functions
~   Control flow
</section>


# Abstract Data Types {.big-code}

```haskell
-- sum type, 3 possible values
data Choice = Definitely
            | Possibly
            | NoWay

-- product type, 9 possible values (3 * 3)
data Choices = Choices Choice Choice

-- record syntax defines accessors automatically
data Choices = Choices { fstChoice :: Choice
                       , sndChoice :: Choice
                       }
```
</section>

<section id="using-types" class="big-code small-title">
<h1>Using Types</h1>

```haskell
-- Bindings can be annotated
success :: a -> Maybe a
-- Constructors are functions
success = Just

-- Constructors can be pattern matched
-- _ is a wildcard
case success True of
  Just True -> ()
  _         -> ()

-- Values can be annotated in-line
2 ^ (1 :: Int)

```

# Typeclass Syntax {.big-code}

```haskell
class Equals a where
  isEqual :: a -> a -> Bool

instance Equals Choice where
  isEqual Definitely Definitely = True
  isEqual Possibly   Possibly   = True
  isEqual NoWay      NoWay      = True
  isEqual _          _          = False

instance (Equals a) => Equals [a] where
  isEqual (a:as) (b:bs) = isEqual a b &&
                          isEqual as bs
  isEqual as     bs     = null as && null bs
```

# Bindings &amp; Functions {.big-code}

```haskell

greeting :: String
greeting = "Hello, "

sayHello :: String -> String
sayHello name = greeting ++ name
-- desugars to:
sayHello = \name -> (++) greeting name

sayHello name = result
  where result = greeting ++ name
-- desugars to:
sayHello = \name ->
  let result = (++) greeting name
  in result
```

# Pattern Matching {.big-code}

```haskell

-- Unlike Erlang, pattern matching is only on
-- constructors, never variables
isJust (Just _) = True
isJust Nothing  = False
-- desugars to:
isJust = \x ->
  case x of
    (Just _) -> True
    Nothing  -> False
```

# Guards {.big-code}

```haskell

isNegative :: (Num a) => a -> Bool
isNegative x
  | x < 0     = True
  | otherwise = False
-- desugars to:
isNegative = \x ->
  if (<) x 0
  then True
  else False
```

# &#96;Infix&#96; and (Prefix) {.big-code}

```haskell
-- Symbolic operators can be used
-- prefix when in (parentheses)
(+) a b

-- Named functions can be used
-- infix when in `backticks`
x `elem` xs

-- infixl, infixr define associativity
-- and precedence (0 lowest, 9 highest)
infixr 5 `append`
a `append` b = a ++ b

```

# Do syntax {.big-code}

```haskell

do m
-- desugars to:
m

do a <- m
   return a
-- desugars to:
m >>= \a -> return a

do m
   return ()
-- desugars to:
m >> return ()
```

# Key Features

* Interactive
* Declarative
* Pure
* Non-strict (lazy) evaluation
* Types and typeclasses
* Abstractions
* Multi-paradigm
</section>

# GHCi

<h2>Interactive Haskell</h2>

# {#runhaskell}

```bash

$ runhaskell --help
Usage: runghc [runghc flags] [GHC flags] module [program args]

The runghc flags are
    -f /path/to/ghc       Tell runghc where GHC is
    --help                Print this usage information
    --version             Print version number
```

# {#ghci-start}

```haskell

$ ghci
GHCi, version 7.6.3: http://www.haskell.org/ghc/  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
h> 
```

# {#ghci-t .big-code}

<h2>
`:t` shows type information</h2>
```haskell

h> :t map
map :: (a -> b) -> [a] -> [b]
h> :t map (+1)
map (+1) :: Num b => [b] -> [b]
h> :t (>>=)
(>>=) :: Monad m => m a -> (a -> m b) -> m b
```

# #{ghci-i-typeclass .big-code}

<h2>`:i` shows typeclass info</h2>
```haskell

h> :i Num
class Num a where
  (+) :: a -> a -> a
  (*) :: a -> a -> a
  (-) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
    -- Defined in `GHC.Num'
instance Num Integer -- Defined in `GHC.Num'
instance Num Int -- Defined in `GHC.Num'
instance Num Float -- Defined in `GHC.Float'
instance Num Double -- Defined in `GHC.Float'
```

# {#ghci-i-value .big-code}

<h2>`:i` shows value info</h2>
```haskell

h> :info map
map :: (a -> b) -> [a] -> [b]   
-- Defined in `GHC.Base'
h> :info (>>=)
class Monad m where
  (>>=) :: m a -> (a -> m b) -> m b
  ...
  	-- Defined in `GHC.Base'
infixl 1 >>=
```

# {#ghci-i-type .big-code}

<h2>`:i` shows type info</h2>
```haskell

h> :info Int
data Int = ghc-prim:GHC.Types.I#
  ghc-prim:GHC.Prim.Int#
  -- Defined in `ghc-prim:GHC.Types'
instance Bounded Int -- Defined in `GHC.Enum'
instance Enum Int -- Defined in `GHC.Enum'
instance Eq Int -- Defined in `GHC.Classes'
instance Integral Int -- Defined in `GHC.Real'
instance Num Int -- Defined in `GHC.Num'
instance Ord Int -- Defined in `GHC.Classes'
instance Read Int -- Defined in `GHC.Read'
instance Real Int -- Defined in `GHC.Real'
instance Show Int -- Defined in `GHC.Show'
```

# {#ghci-load-reload .big-code}

<h2>`:l` load a module</h2>
<h2>`:r` to reload</h2>
```haskell

h> :! echo 'hello = print "hello"' > Hello.hs
h> :l Hello
[1 of 1] Compiling Main ( Hello.hs, interpreted )
Ok, modules loaded: Main.
h> hello
"hello"
h> :! echo 'hello = print "HELLO"' > Hello.hs
h> :r
[1 of 1] Compiling Main ( Hello.hs, interpreted )
Ok, modules loaded: Main.
h> hello
"HELLO"
```

# Declarative

* "Describe the problem, not the solution"
* Great syntax for this (but not C-like)!
* Functional code is (often) easier to understand and test
* Pure, no side-effects?!

# {#merge-sort}

```haskell

-- MergeSort1.hs
module MergeSort1 (mergeSort) where

-- | Bottom-up merge sort.
mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort xs = mergeAll [[x] | x <- xs]

mergeAll :: Ord a => [[a]] -> [a]
mergeAll [xs] = xs
mergeAll xss  = mergeAll (mergePairs xss)

mergePairs :: Ord a => [[a]] -> [[a]]
mergePairs (a:b:xs) =
  merge a b : mergePairs xs
mergePairs xs = xs

merge :: Ord a => [a] -> [a] -> [a]
merge as@(a:as') bs@(b:bs')
 | a > b     = b : merge as bs'
 | otherwise = a : merge as' bs
merge [] bs = bs
merge as [] = as
```

# {#merge-sort-2}

```haskell

-- MergeSort2.hs
module MergeSort2 (mergeSort) where

-- | Bottom-up merge sort.
mergeSort :: Ord a => [a] -> [a]
mergeSort = mergeAll . map (:[])
  where
    mergeAll []   = []
    mergeAll [xs] = xs
    mergeAll xss  = mergeAll (mergePairs xss)

    mergePairs (a:b:xs) =
      merge a b : mergePairs xs
    mergePairs xs = xs

    merge as@(a:as') bs@(b:bs')
      | a > b     = b : merge as bs'
      | otherwise = a : merge as' bs
    merge [] bs = bs
    merge as [] = as
```

# {#merge-sort-python .small-code}

```python
# merge_sort.py
def merge_sort(lst):
    if not lst:
        return []
    lists = [[x] for x in lst]
    while len(lists) > 1:
        lists = merge_lists(lists)
    return lists[0]

def merge_lists(lists):
    result = []
    for i in range(0, len(lists) // 2):
        result.append(merge2(lists[i*2], lists[i*2 + 1]))
    if len(lists) % 2:
        result.append(lists[-1])
    return result

def merge2(xs, ys):
    i = 0
    j = 0
    result = []
    while i < len(xs) and j < len(ys):
        x = xs[i]
        y = ys[j]
        if x > y:
            result.append(y)
            j += 1
        else:
            result.append(x)
            i += 1
    result.extend(xs[i:])
    result.extend(ys[j:])
    return result
```

# {#side-effects .big-code}

```haskell

-- WordCount1.hs

main :: IO ()
main = do
  input <- getContents
  let wordCount = length (words input)
  print wordCount
```

# {#side-effects-2 .big-code}

```haskell

-- WordCount2.hs

main :: IO ()
main =
  getContents >>= \input ->
    let wordCount = length (words input)
    in print wordCount
```

# {#side-effects-3 .big-code}

```haskell

-- WordCount3.hs

main :: IO ()
main = getContents >>= print . length . words
```

# what.the `>>=`?

* `do` is just syntax sugar for the `>>=` (bind) operator.
* IO is still purely functional, we are just building a graph
  of actions, *not* executing them in-place!
* Starting from `main`, the Haskell runtime will *interpret* these actions
* It works much like continuation passing style, with a state
  variable for the current world state (behind the scenes)
* There are ways to cheat and write code that is not pure, but you
  will have to go out of your way to do it

# Common combinators {.big-code}

```haskell

-- Function composition
(.) :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)

-- Function application (with a lower precedence)
($) :: (a -> b) -> a -> b
f $ x =  f x
```

# Pure

* Haskell's purity implies referential transparency
* This means that function invocation can be freely replaced with its
  return value without changing semantics
* Fantastic for optimizations
* Also enables equational reasoning, which makes it easier to prove
  code correct

# {#compiler}

<!--
https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/HscMain
-->
<svg viewBox="0 0 1000 1000" class="full diagram">
  <defs>
    <marker id="Triangle"
      viewBox="0 0 10 10" refX="0" refY="5" 
      markerUnits="strokeWidth"
      markerWidth="4" markerHeight="3"
      orient="auto">
      <path d="M 0 0 L 10 5 L 0 10 z" />
    </marker>
  </defs>
  <g class="right-title" transform="translate(1000, 20)">
    <text>GHC compilation phases</text>
  </g>
  <g class="phase parse" transform="translate(500, 85)">
    <line y1="-85" y2="-65" marker-end="url(#Triangle)" />
    <ellipse rx="120" ry="35"/>
    <text>Parse</text>
  </g>
  <g class="phase rename" transform="translate(500, 215)">
    <line y1="-85" y2="-65" marker-end="url(#Triangle)" />
    <ellipse rx="120" ry="35"/>
    <text>Rename</text>
  </g>
  <g class="phase typecheck" transform="translate(500, 345)">
    <line y1="-85" y2="-65" marker-end="url(#Triangle)" />
    <ellipse rx="120" ry="35"/>
    <text>Typecheck</text>
  </g>
  <g class="phase desugar" transform="translate(500, 475)">
    <line y1="-85" y2="-65" marker-end="url(#Triangle)" />
    <ellipse rx="120" ry="35"/>
    <text>Desugar</text>
  </g>
  <g class="phase optimize" transform="translate(500, 605)">
    <line y1="-85" y2="-65" marker-end="url(#Triangle)" />
    <path d="M 65,35 a 160,80 0 1,0 40,-80" marker-end="url(#Triangle)"/>
    <text x="220" class="outside">Core</text>
    <ellipse rx="120" ry="35"/>
    <text>Optimize</text>
  </g>
  <g class="phase codegen" transform="translate(500, 735)">
    <line y1="-85" y2="-65" marker-end="url(#Triangle)" />
    <ellipse rx="120" ry="35"/>
    <text>Code gen</text>
  </g>
  <g class="phase llvm" transform="translate(500, 865)">
    <line y1="-85" y2="-65" marker-end="url(#Triangle)" />
    <ellipse rx="120" ry="35"/>
    <text>LLVM</text>
    <line y1="45" y2="65" marker-end="url(#Triangle)" />
  </g>
</svg>

# Optimizations

<!--
http://stackoverflow.com/questions/12653787/what-optimizations-can-ghc-be-expected-to-perform-reliably 
http://research.microsoft.com/en-us/um/people/simonpj/papers/spec-constr/spec-constr.pdf
http://www.haskell.org/ghc/docs/latest/html/users_guide/options-optimise.html
-->

* Common sub-expression elimination
* Inlining (cross-module too!)
* Specialize
* Float out
* Float inwards
* Demand analysis
* Worker/Wrapper binds
* Liberate case
* Call-pattern specialization (SpecConstr)

# GHC RULES!
<!--
http://www.haskell.org/haskellwiki/Playing_by_the_rules
http://www.haskell.org/haskellwiki/GHC/Using_rules
https://ghc.haskell.org/trac/ghc/wiki/RewriteRules
-->

* Term rewriting engine
* RULES pragma allows *library defined optimizations*
* Used to great effect for short cut fusion
* Example: `map f (map g xs) = map (f . g) xs`
* Prevent building of intermediate data structures
* Commonly used for lists, Text, ByteString, etc.
* Great incentive to write high-level code!
* ANY LIBRARY CAN USE THIS!

# {#ghc-rules-ex .big-code}

```haskell

{-# RULES
"ByteString specialise break (x==)" forall x.
    break ((==) x) = breakByte x
"ByteString specialise break (==x)" forall x.
    break (==x) = breakByte x
  #-}
```

# Lazy

* Call by need (outside in), not call by value (inside out)
* Non-strict evaluation separates equation from execution
* No need for special forms for control flow, no value restriction
* Enables infinite or cyclic data structures
* Can skip unused computation (better minimum bounds)

# {#lazy-ramsey}

![lazy](img/ramsey-lazy-2013.jpg)


# Call by need

<!--
https://ghc.haskell.org/trac/ghc/wiki/Commentary/Compiler/GeneratedCode
http://research.microsoft.com/apps/pubs/default.aspx?id=67083
-->

* Expressions are translated into a graph (not a tree!)
* Evaluated with STG (Spineless Tagless G-Machine)
* Pattern matching forces evaluation

# {#evaluation}

```haskell

-- [1..] is an infinite list, [1, 2, 3, ...]
print (head (map (*2) [1..]))
-- Outside in, print x = putStrLn (show x)
putStrLn (show (head (map (*2) [1..]))
-- head (x:_) = x
-- map f (x:xs) = f x : map f xs
-- desugar [1..] syntax
putStrLn (show (head (map (*2) (enumFrom 1))))
-- enumFrom n = n : enumFrom (succ n)
putStrLn (show (head (map (*2) (1 : enumFrom (succ 1)))))
-- apply map
putStrLn (show (head ((1*2) : map (*2) (enumFrom (succ 1)))))
-- apply head
putStrLn (show (1*2))
-- show pattern matches on its argument
putStrLn (show 2)
-- apply show
putStrLn "2"
```

# {#control-flow .big-code}

```haskell

if' :: Bool -> a -> a -> a
if' cond a b = case cond of
  True  -> a
  False -> b

(&&) :: Bool -> Bool -> Bool
a && b = case a of
  True  -> b
  False -> False

const :: a -> b -> a
const x = \_ -> x
```

# {#infinite-programming .big-code}

```haskell

fib :: [Integer]
fib = 0 : 1 : zipWith (+) fib (tail fib)

cycle :: [a] -> [a]
cycle xs = xs ++ cycle xs

iterate :: (a -> a) -> a -> [a]
iterate f x = x : iterate f (f x)

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile p (x:xs)
  | p x       = x : takeWhile p xs
  | otherwise = []
```

# Types

* Enforce constraints at compile time
* No NULL
* Can have parametric polymorphism and/or recursion
* Built-in types are not special (other than syntax)
* Typeclasses for *ad hoc* polymorphism (overloading)

# {#constraints}

```haskell

h> let f x = head True

<interactive>:23:16:
    Couldn't match expected type `[a0]' with actual type `Bool'
    In the first argument of `head', namely `True'
    In the expression: head True
    In an equation for `f': f x = head True

h> let f x = heads True

<interactive>:24:11:
    Not in scope: `heads'
    Perhaps you meant one of these:
      `reads' (imported from Prelude), `head' (imported from Prelude)
```

# No Null References

* Haskell doesn't repeat Hoare's "[Billion Dollar Mistake](http://www.infoq.com/presentations/Null-References-The-Billion-Dollar-Mistake-Tony-Hoare)"
* Instead of `NULL`, wrap the value in a sum type such as `Maybe` or `Either`
* Bottom ⊥ can be expressed in any type, as it's always possible to
  express a computation that does not terminate

# {#no-null-code .big-code}

```haskell

data Maybe a = Just a
             | Nothing

data Either a b = Left a
                | Right b

parseBit :: Char -> Maybe Int
parseBit '0' = Just 0
parseBit '1' = Just 1
parseBit _ = Nothing
```

# {#bottoms}
```haskell

h> let x = x in x
-- Infinite recursion, not a fun case to deal with!

h> case False of True -> ()
*** Exception: <interactive>:29:1-24: Non-exhaustive patterns in case

h> head []
*** Exception: Prelude.head: empty list

h> error "this throws an exception"
*** Exception: this throws an exception

h> undefined
*** Exception: Prelude.undefined
```

# {#polymorphic}

```haskell

-- Polymorphic and recursive
data List a = Cons a (List a)
            | Nil
            deriving (Show)

data Tree a = Leaf a
            | Branch (Tree a) (Tree a)
            deriving (Show)

listMap :: (a -> b) -> List a -> List b
listMap _ Nil         = Nil
listMap f (Cons x xs) = Cons (f x) (listMap f xs)

treeToList :: Tree a -> List a
treeToList root = go root Nil
  where
    -- Note that `go` returns a function!
    go (Leaf x)     = Cons x
    go (Branch l r) = go l . go r
```

# {#built-in-types .big-code}

```haskell

-- (), pronounced "unit"
unit :: ()
unit = ()

-- Char
someChar :: Char
someChar = 'x'

-- Instances of Num typeclass
someDouble :: Double
someDouble = 1

-- Instances of Fractional typeclass
someRatio :: Rational
someRatio = 1.2345
```

# {#tuples .big-code}

```haskell

-- [a], type can be written prefix as `[] a`
someList, someOtherList :: [Int]
someList = [1, 2, 3]
someOtherList = (:) 4 (5 : (:) 6 [])

-- (a, b), can be written prefix as `(,) a b`
someTuple, someOtherTuple :: (Int, Char)
someTuple = (10, '4')
someOtherTuple = (,) 4 '2'

-- [Char], also known as String
-- (also see the OverloadedStrings extension)
someString :: String
someString = "foo"
```

# Typeclasses

* Used for many of the Prelude operators and numeric literals
* Ad hoc polymorphism (overloading)
* Many built-in typeclasses can be automatically derived
  (Eq, Ord, Enum, Bounded, Show, and Read)!

# {#typeclass-example .big-code}

```haskell

module List where

data List a = Cons a (List a)
            | Nil

instance (Eq a) => Eq (List a) where
  (Cons a as) == (Cons b bs) = a == b && as == bs
  Nil         == Nil         = True
  _           == _           = False

instance Functor List where
  fmap _ Nil         = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

```

# {#typeclass-example-2 .big-code}

<!-- http://www.haskell.org/ghc/docs/latest/html/users_guide/deriving.html -->
```haskell

{-# LANGUAGE DeriveFunctor #-}

module List where

data List a = Cons a (List a)
            | Nil
            deriving (Eq, Functor)

```

# {#newtype .big-code}

```haskell

import Data.List (sort)

newtype Down a = Down { unDown :: a }
                 deriving (Eq)

instance (Ord a) => Ord (Down a) where
  compare (Down a) (Down b) = case compare a b of
    LT -> GT
    EQ -> EQ
    GT -> LT

reverseSort :: Ord a => [a] -> [a]
reverseSort = map unDown . sort . map Down

```

# Abstractions

Monoid
~   Has an identity and an associative operation
Functor
~   Anything that can be mapped over (preserving structure)
Applicative
~   Functor, but can apply function from inside
Monad
~   Applicative, but can return any structure

# Monoid

```haskell
class Monoid a where
  mempty :: a
  mappend :: a -> a -> a

instance Monoid [a] where
  mempty = []
  mappend = (++)

infixr 6 <>
(<>) :: (Monoid a) => a -> a -> a
(<>) = mappend
```

# Functor

```haskell
class Functor f where
  fmap :: (a -> b) -> f a -> f b

instance Functor [] where
  fmap = map

instance Functor Maybe where
  fmap f (Just x) = Just (f x)
  fmap _ Nothing  = Nothing

infixl 4 <$>
(<$>) :: Functor f => (a -> b) -> f a -> f b
(<$>) = fmap
```

# Applicative

```haskell
class (Functor f) => Applicative f where
  pure :: a -> f a
  infixl 4 <*>
  (<*>) :: f (a -> b) -> f a -> f b

instance Applicative [] where
  pure x = [x]
  fs <*> xs = concatMap (\f -> map f xs) fs

instance Applicative Maybe where
  pure = Just
  Just f <*> Just x = Just (f x)
  _      <*> _      = Nothing
```
</section>

# Monad

```haskell
class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b
  (>>)  :: m a -> m b -> m b
  ma >> mb = ma >>= \_ -> mb

instance Monad [] where
  return = pure
  m >>= f = concatMap f m

instance Monad Maybe where
  return = pure
  Just x  >>= f = f x
  Nothing >>= _ = Nothing
```

# Parser Combinators

# {#parsing}

```haskell
{-# LANGUAGE OverloadedStrings #-}
module SJSON where
import Prelude hiding (concat)
import Data.Text (Text, concat)
import Data.Attoparsec.Text
import Control.Applicative

data JSON = JArray [JSON]
          | JObject [(Text, JSON)]
          | JText Text
          deriving (Show)

pJSON :: Parser JSON
pJSON = choice [ pText, pObject, pArray ]
  where
    pString = concat <$> "\"" .*> many pStringChunk <*. "\""
    pStringChunk = choice [ "\\\"" .*> pure "\""
                          , takeWhile1 (not . (`elem` "\\\""))
                          , "\\" ]
    pText = JText <$> pString
    pPair = (,) <$> pString <*. ":" <*> pJSON
    pObject = JObject <$> "{" .*> (pPair `sepBy` ",") <*. "}"
    pArray = JArray <$> "[" .*> (pJSON `sepBy` ",") <*. "]"
```

# Foreign Function Interface

# {#ffi .big-code}

```haskell

{-# LANGUAGE ForeignFunctionInterface #-}

import Foreign.C.Types
import Control.Monad

foreign import ccall unsafe "stdlib.h rand"
     c_rand :: IO CUInt

main :: IO ()
main = replicateM_ 20 (c_rand >>= print)
```

# Parallel Programming

# {#parallel-flip-image}

```haskell
-- FlipImage.hs
import System.Environment
import Data.Word
import Data.Array.Repa hiding ((++))
import Data.Array.Repa.IO.DevIL
import Data.Array.Repa.Repr.ForeignPtr

main :: IO () 
main = do
  [f] <- getArgs
  (RGB v) <- runIL $ readImage f
  rotated <- (computeP $ rot180 v) :: IO (Array F DIM3 Word8)
  runIL $ writeImage ("flip-"++f) (RGB rotated)

rot180 :: (Source r e) => Array r DIM3 e -> Array D DIM3 e
rot180 g = backpermute e flop g
  where
    e@(Z :. x :. y :. _) = extent g
    flop (Z :. i         :. j         :. k) =
         (Z :. x - i - 1 :. y - j - 1 :. k)
```

# Concurrency

# {#cost-of-concurrency}

RAM footprint per unit of concurrency (approx)

<table id="concurrency-table">
<tr class="haskell">
    <td class="num">1.3KB</td>
    <td class="name">
        <div class="bar-ctr"><div class="bar"></div></div>
        <span>Haskell ThreadId + MVar (GHC 7.6.3, 64-bit)</span>
    </td>
</tr>
<tr class="erlang">
    <td class="num">2.6 KB</td>
    <td class="name">
        <div class="bar-ctr"><div class="bar"></div></div>
        <span>Erlang process (64-bit)</span>
    </td>
</tr>
<tr class="go">
    <td class="num">8.0 KB</td>
    <td class="name">
        <div class="bar-ctr"><div class="bar"></div></div>
        <span>Go goroutine</span>
    </td>
</tr>
<tr class="java-min">
    <td class="num">64.0 KB</td>
    <td class="name">
        <div class="bar-ctr"><div class="bar"></div></div>
        <span>Java thread stack (minimum)</span>
    </td>
</tr>
<tr class="c-min">
    <td class="num">64.0 KB</td>
    <td class="name">
        <div class="bar-ctr"><div class="bar"></div></div>
        <span>C pthread stack (minimum)</span>
    </td>
</tr>
<tr class="placeholder"><td colspan="2"><hr/></td></td>
<tr class="java">
    <td class="num">1 MB</td>
    <td class="name">
        <div class="bar-ctr"><div class="bar"></div></div>
        <span>Java thread stack (default)</span>
    </td>
</tr>
<tr class="c">
    <td class="num">8 MB</td>
    <td class="name">
        <div class="bar-ctr"><div class="bar"></div></div>
        <span>C pthread stack (default, 64-bit Mac OS X)</span>
    </td>
</tr>
</table>

# {#concurrent-http}

```haskell

import Control.Concurrent
import Network.HTTP

getHTTP :: String -> IO String
getHTTP url = simpleHTTP (getRequest url) >>= getResponseBody

urls :: [String]
urls = map ("http://ifconfig.me/"++) ["ip", "host"]

startRequest :: String -> IO (MVar ())
startRequest url = do
  v <- newEmptyMVar
  forkIO (getHTTP url >>= putStr >> putMVar v ())
  return v

main :: IO ()
main = do
  mvars <- mapM startRequest urls
  mapM_ takeMVar mvars
```

# Why not Haskell?

* Lots of new terminology
* Mutable state takes more effort
* Laziness changes how you need to reason about code
* Once you get used to it, these aren't problematic

# {#terminology}

<em>A monad is just a monoid in the category of endofunctors, what's
the problem?</em>

Terminology from category theory can be intimidating (at first)!

`return` probably doesn't mean what you think it means.

# {#mutable-state-js .big-code}

```javascript

function main() {
  var foo = {bar: 1, baz: 20};
  while (foo.baz > foo.bar) {
    foo.bar += 1;
  }
  console.log(foo);
}
```
</section>

<section id="mutable-state-hs" class="big-code">
```haskell
import Control.Concurrent
data Foo = Foo {bar :: Int, baz :: Int}
         deriving (Show)

main :: IO ()
main = do
  fooVar <- newMVar (Foo { bar = 1, baz = 20 })
  let whileLoop = do
      foo <- takeMVar fooVar
      if baz foo > bar foo
      then do
        putMVar fooVar (foo { bar = 1 + bar foo })
        whileLoop
      else
        putMVar fooVar foo
  whileLoop
  withMVar fooVar print
```

# {#laziness-behavior-1 .big-code}

```haskell

sum :: Num a => [a] -> a
sum []     = 0
sum (x:xs) = x + sum xs
```

# {#laziness-behavior-2 .big-code}

```haskell
sum :: Num [a] => [a] -> a
sum = go 0
  where
    go acc (x:xs) = go (acc + x) (go xs)
    go acc []     = acc
```

# {#laziness-behavior-3 .big-code}

```haskell
sum :: Num [a] => [a] -> a
sum = go 0
  where
    go acc _
      | seq acc False = undefined
    go acc (x:xs)     = go (acc + x) (go xs)
    go acc []         = acc
```

# {#laziness-behavior-4 .big-code}

```haskell
{-# LANGUAGE BangPatterns #-}

sum :: Num [a] => [a] -> a
sum = go 0
  where
    go !acc (x:xs) = go (acc + x) (go xs)
    go  acc []     = acc
```

# Notable Libraries

# Web Frameworks

[Snap](http://snapframework.com/) 
~   HTTP + Templates. Extensible with "Snaplets"
[Yesod](http://www.yesodweb.com/)
~   Full stack, uses Template Haskell
[Happstack](http://happstack.com/)
~   Full stack, does not rely on Template Haskell (happstack-lite)
[scotty](https://github.com/ku-fpg/scotty)
~   Like Ruby Sinatra, great for simple REST apps

# Publishing and docs

[Haddock](http://www.haskell.org/haddock/)
~   Standard library documentation tool for Haskell projects
[diagrams](http://projects.haskell.org/diagrams/)
~   DSL for vector graphics
[hakyll](http://jaspervdj.be/hakyll/)
~   Static site generator
[Pandoc]
~   Markup format swiss-army knife (Markdown, LaTeX, EPUB, &hellip;)

# Parser Combinators

[Parsec](http://hackage.haskell.org/package/parsec)
~   Industrial strength, monadic parser combinator library for Haskell
[attoparsec](http://hackage.haskell.org/package/attoparsec)
~   Like Parsec, but makes a few trade-offs for performance

# Dev Tools

[HLint]
~   Suggests improvements for your code
[ghc-mod], [hdevtools]
~   Editor integration
[Hoogle](http://www.haskell.org/hoogle/), [Hayoo](http://holumbus.fh-wedel.de/hayoo/hayoo.html)
~   Search for Haskell functions by name or *by type*!
[Djinn](http://hackage.haskell.org/package/djinn)
~   Automatically generate code given a type!
[tidal](https://hackage.haskell.org/package/tidal)
~   DSL for live coding music patterns ("algorave")

# Parallel / Distributed

[repa](http://repa.ouroborus.net/)
~   High performance, regular, multi-dimensional arrays (with multi-core!)
[accelerate](https://github.com/AccelerateHS/accelerate/)
~   Like repa, but can utilize CUDA to run on GPUs
[Cloud Haskell](http://haskell-distributed.github.io/)
~   Erlang-like concurrency and distribution for Haskell

# Testing &amp; Profiling

[QuickCheck](http://hackage.haskell.org/package/QuickCheck)
~   Property based testing
[HUnit](http://hackage.haskell.org/package/HUnit)
~   Standard unit testing framework
[hpc](http://www.haskell.org/haskellwiki/Haskell_program_coverage)
~   Haskell Program Coverage
[ThreadScope](http://www.haskell.org/haskellwiki/ThreadScope)
~   Visualize multi-core utilization
[criterion](https://github.com/bos/criterion)
~   Gold standard for performance benchmarking
[EKG](https://github.com/tibbe/ekg)
~   Embeds a web-server for live monitoring of metrics

# Learn More

Books
~   [Learn You a Haskell for Great Good](http://learnyouahaskell.com/)
~   [Parallel and Concurrent Programming in Haskell](http://chimera.labs.oreilly.com/books/1230000000929)
~   [Real World Haskell](http://book.realworldhaskell.org/)
Lectures
~   [Functional Systems in Haskell](http://www.scs.stanford.edu/11au-cs240h/) -
    CS240h Autumn 2011, Stanford
~   [Introduction to Haskell](http://shuklan.com/haskell/index.html) -
    CS1501 Spring 2013, UVA
~   [Introduction to Haskell](http://www.seas.upenn.edu/~cis194/) -
    CIS 194 Spring 2013, UPenn
~   [Haskell Track](http://courses.cms.caltech.edu/cs11/material/haskell/) -
    CS 11 Fall 2011, Caltech
Practice
~   [exercism.io](http://exercism.io/),
    [Talentbuddy](http://www.talentbuddy.co/),
    [HackerRank](https://www.hackerrank.com/)
~   [H-99](http://www.haskell.org/haskellwiki/H-99:_Ninety-Nine_Haskell_Problems),
    [Project Euler](http://projecteuler.net/)

# Thanks!

+-------------+----------------------------------------------------+
| **Slides**  | <http://bob.ippoli.to/haskell-for-erlangers-2014/> |
+-------------+----------------------------------------------------+
| **Source**  | [github.com/etrepum/haskell-for-erlangers-2014]    |
+-------------+----------------------------------------------------+
| **Email**   | bob@redivi.com                                     |
+-------------+----------------------------------------------------+
| **Twitter** | [&#64;etrepum](https://twitter.com/etrepum)        |
+-------------+----------------------------------------------------+

<!--
Other interesting presentations:
http://shuklan.com/haskell/lec01.html
http://ugcs.net/~keegan/talks/why-learn-haskell/talk.pdf

TODO
http://www.haskell.org/haskellwiki/Learn_Haskell_in_10_minutes
http://www.haskell.org/tutorial/goodies.html

-->

[github.com/etrepum/haskell-for-erlangers-2014]: https://github.com/etrepum/haskell-for-erlangers-2014
[hdevtools]: https://github.com/bitc/hdevtools
[ghc-mod]: http://www.mew.org/~kazu/proj/ghc-mod/en/
[HLint]: http://community.haskell.org/~ndm/hlint/
[Pandoc]: http://johnmacfarlane.net/pandoc/
