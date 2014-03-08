# {#title}

<h1>
    Intro to Haskell<br>
    for Erlangers
</h1>
<h3>
    Bob Ippolito (<a href="https://twitter.com/etrepum">@etrepum</a>)<br>
    Erlang Factory SF<br>
    March 7, 2014
</h3>
<h4>
[bob.ippoli.to/haskell-for-erlangers-2014]
</h4>

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
- I like QuickCheck and Dialyzer
- Good support for parallelism and concurrency
- Will help me understand more CS papers

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

# Starting out

- Intimidated by Haskell for years
- Took a class while at Facebook
- Read several books
- Deliberate practice

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

# {#ifip-1992-erl}

<!-- extracted from history.pdf -->
<figure>
<img src="img/ifip-1992-erl.jpg" />
<figcaption>John Hughes (QuickCheck), Philip Wadler (Subtyping for Erlang)</figcaption>
</figure>

# Evolution

1992
~   Glasgow Haskell Compiler (GHC)
1996
~   Haskell 1.3 - Monadic I/O, seq, strictness annotations
1999
~   Haskell 98 - Commitment to stability
2002
~   Revised Haskell 98 (260 pages)
2010
~   Haskell 2010 (300 pages)

# Domain

**General Purpose**

* Very effective for parsing and compilation
* Great for DSEL (Domain Specific Embedded Languages)
* Has been popular in academia for some time
* Becoming more popular in industry

# Commercial Use
<!-- http://www.haskell.org/haskellwiki/Haskell_in_industry -->

Internet
~   [Facebook](https://skillsmatter.com/skillscasts/4429-simon-marlow) - 
    Haxl rule engine "fighting spam with pure functions"
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

# Relative to Erlang

* Syntax is minimal & familiar
* Haskell's pattern matching is not as clever as Erlang's
* Types are kinda like having Dialyzer for every compile<br>
  (although Dialyzer is really quite different!)
* Typeclasses are nice, Erlang doesn't have them
* Erlang is probably (much) better for long-running systems

# lists:map/2 {.big-code}

```erlang
map(F, [H|T]) ->
    [F(H)|map(F, T)];
map(F, []) when is_function(F, 1) -> [].
```

# map {.big-code}

```haskell
map _ []     = []
map f (x:xs) = f x : map f xs
```

# lists:map/2 (typed) {.big-code}

```erlang
-spec map(Fun, List1) -> List2 when
      Fun :: fun((A) -> B),
      List1 :: [A],
      List2 :: [B],
      A :: term(),
      B :: term().

map(F, [H|T]) ->
    [F(H)|map(F, T)];
map(F, []) when is_function(F, 1) -> [].
```

# map (typed) {.big-code}

```haskell
map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs
```

# lists:foldr/3 {.big-code}

```erlang
-spec foldr(Fun, Acc0, List) -> Acc1 when
      Fun :: fun((Elem :: T, AccIn) -> AccOut),
      Acc0 :: term(),
      Acc1 :: term(),
      AccIn :: term(),
      AccOut :: term(),
      List :: [T],
      T :: term().

foldr(F, Accu, [Hd|Tail]) ->
    F(Hd, foldr(F, Accu, Tail));
foldr(F, Accu, []) when is_function(F, 2) -> Accu.
```

# foldr {.big-code}

```haskell
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr k z = go
   where
     go []     = z
     go (y:ys) = y `k` go ys
```

# Sum Type {.small-title .big-code}

```erlang
%% sum type, 3 possible values
-type choice() :: definitely
                | possibly
                | no_way.
```

# Sum Type {.small-title .big-code}

```haskell
-- sum type, 3 possible values
data Choice = Definitely
            | Possibly
            | NoWay
```

# Product Type {.small-title .big-code}

```erlang
%% product type, 9 possible values (3 * 3)
-type choices() :: {choice(), choice()}.
```

# Product Type {.small-title .big-code}

```haskell
-- product type, 9 possible values (3 * 3)
data Choices = Choices Choice Choice

-- as a tuple with a type alias
-- NOT THE SAME AS ABOVE! :)
type Choices = (Choice, Choice)
```

# Product Type (Record) {.small-title .big-code}

```erlang
%% record syntax
-record(choices,
        fst_choice :: choice(),
        snd_choice :: choice()).

%% getters need to be implemented manually
-spec fst_choice(#choices{}) -> choice().
fst_choice(#choices{fst_choices=X}) -> X.

-spec snd_choice(#choices{}) -> choice().
snd_choice(#choices{snd_choices=X}) -> X.
```

# Product Type (Record) {.small-title .big-code}

```haskell
-- record syntax defines accessors automatically
data Choices =
  Choices { fstChoice :: Choice
          , sndChoice :: Choice
          }

-- these getters are automatically defined
fstChoice :: Choices -> Choice
fstChoice (Choices { fstChoice = x }) = x

sndChoice :: Choices -> Choice
sndChoice (Choices { sndChoice = x }) = x
```

# Abstract Data Type {.small-title .big-code}

```erlang
%% abstract data type for a list
-type cons(A) :: nil
               | {cons, A, cons(A)}.
```

# Abstract Data Type {.small-title .big-code}

```haskell
-- abstract data type for a list
data List a = Nil
            | Cons a (List a)
```

# {#types-and-constructors-1 .small-title .big-code .highlight-type}

<h1><span class="hl-type">Types</span> and <span class="hl-constructor">Constructors</span></h1>

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="kw">data</span> <span class="dt hl-type">Choice</span> <span class="fu">=</span> <span class="dt hl-constructor">Definitely</span>
            <span class="fu">|</span> <span class="dt hl-constructor">Possibly</span>
            <span class="fu">|</span> <span class="dt hl-constructor">NoWay</span>

<span class="kw">data</span> <span class="dt hl-type">Choices</span> <span class="fu">=</span> <span class="dt hl-constructor">Choices</span> <span class="dt hl-type">Choice</span> <span class="dt hl-type">Choice</span>

<span class="ot">mkChoices ::</span> <span class="dt hl-type">Choice</span> <span class="ot">-&gt;</span> <span class="dt hl-type">Choice</span> <span class="ot">-&gt;</span> <span class="dt hl-type">Choices</span>
mkChoices a b <span class="fu">=</span> <span class="dt hl-constructor">Choices</span> a b

<span class="ot">fstChoice ::</span> <span class="dt hl-type">Choices</span> <span class="ot">-&gt;</span> <span class="dt hl-type">Choice</span>
fstChoice (<span class="dt hl-constructor">Choices</span> a _) <span class="fu">=</span> a</code></pre>

# {#types-and-constructors-2 .small-title .big-code .highlight-constructor}

<h1><span class="hl-type">Types</span> and <span class="hl-constructor">Constructors</span></h1>

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="kw">data</span> <span class="dt hl-type">Choice</span> <span class="fu">=</span> <span class="dt hl-constructor">Definitely</span>
            <span class="fu">|</span> <span class="dt hl-constructor">Possibly</span>
            <span class="fu">|</span> <span class="dt hl-constructor">NoWay</span>

<span class="kw">data</span> <span class="dt hl-type">Choices</span> <span class="fu">=</span> <span class="dt hl-constructor">Choices</span> <span class="dt hl-type">Choice</span> <span class="dt hl-type">Choice</span>

<span class="ot">mkChoices ::</span> <span class="dt hl-type">Choice</span> <span class="ot">-&gt;</span> <span class="dt hl-type">Choice</span> <span class="ot">-&gt;</span> <span class="dt hl-type">Choices</span>
mkChoices a b <span class="fu">=</span> <span class="dt hl-constructor">Choices</span> a b

<span class="ot">fstChoice ::</span> <span class="dt hl-type">Choices</span> <span class="ot">-&gt;</span> <span class="dt hl-type">Choice</span>
fstChoice (<span class="dt hl-constructor">Choices</span> a _) <span class="fu">=</span> a</code></pre>

# Using Types {.big-code}

```haskell
-- Values can be annotated in-line
2 ^ (1 :: Int)

-- Bindings can be annotated
success :: a -> Maybe a
-- Constructors are values
-- (and product constructors are functions)
success x = Just x

-- Constructors can be pattern matched
-- _ is a wildcard
case success True of
  Just True -> ()
  _         -> ()
```

# Pattern Matching {.big-code}

```erlang
-spec is_just({just, A} | nothing) -> boolean().
is_just({just, _}) ->
    true;
is_just(nothing) ->
    false.
```

# Pattern Matching {.big-code}

```haskell
isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust Nothing  = False
```

# Pattern Matching {.big-code}

Erlang's pattern matching allows non-linear patterns.

```erlang
-spec is_equal(A, A) -> boolean() when
      A :: term().
is_equal(A, A) -> true;
is_equal(_, _) -> false.
```

# Pattern Matching {.big-code}

Haskell's... does not.

```haskell
isEqual :: a -> a -> Bool
isEqual a b = undefined
```

<blockquote>
This isn't even possible!
Only constructors can be pattern matched.
Types have no built-in equality.
</blockquote>

# &#96;Infix&#96; and (Prefix) {.big-code}

```erlang
%% Symbolic operators can be used
%% as functions from the erlang module
erlang:'+'(A, B).

```

<blockquote>
Erlang doesn't have user-defined infix operators
</blockquote>

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

# Functions & Lambdas {.big-code}

```erlang
-spec add(integer(), integer()) -> integer().
add(X, Acc) ->
    X + Acc.

-spec sum_fun([integer()]) -> integer().
sum_fun(Xs) ->
    lists:foldl(fun add/2, 0, Xs).

-spec sum_lambda([integer()]) -> integer().
sum_lambda(Xs) ->
    lists:foldl(
        fun (X, Acc) -> X + Acc end,
        0,
        Xs).
```

# Functions & Lambdas {.big-code}

```haskell
add :: Integer -> Integer -> Integer
add acc x = acc + x

sumFun :: [Integer] -> Integer
sumFun xs = foldl add 0 xs

sumLambda :: [Integer] -> Integer
sumLambda xs = foldl (\acc x -> acc + x) 0 xs
```

# Functions & Lambdas {.big-code}

* Haskell *only* has functions of one argument
* `a -> b -> c` is really `a -> (b -> c)`
* `f a b` is really `(f a) b`
* Let's leverage that&hellip;

# Functions & Lambdas {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="ot">add ::</span> <span class="dt">Integer</span> <span class="ot">-&gt;</span> <span class="dt">Integer</span> <span class="ot">-&gt;</span> <span class="dt">Integer</span>
add acc x <span class="fu">=</span> acc <span class="fu">+</span> x

<span class="ot">sumFun ::</span> [<span class="dt">Integer</span>] <span class="ot">-&gt;</span> <span class="dt">Integer</span>
sumFun <span class="hl">xs</span> <span class="fu">=</span> foldl add <span class="dv">0</span> <span class="hl">xs</span>

<span class="ot">sumLambda ::</span> [<span class="dt">Integer</span>] <span class="ot">-&gt;</span> <span class="dt">Integer</span>
sumLambda <span class="hl">xs</span> <span class="fu">=</span> foldl (\acc x <span class="ot">-&gt;</span> acc <span class="fu">+</span> x) <span class="dv">0</span> <span class="hl">xs</span></code></pre>

# Functions & Lambdas {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="ot">add ::</span> <span class="dt">Integer</span> <span class="ot">-&gt;</span> <span class="dt">Integer</span> <span class="ot">-&gt;</span> <span class="dt">Integer</span>
add acc x <span class="fu">=</span> acc <span class="fu hl">+</span> x

<span class="ot">sumFun ::</span> [<span class="dt">Integer</span>] <span class="ot">-&gt;</span> <span class="dt">Integer</span>
sumFun <span class="fu">=</span> foldl add <span class="dv">0</span>

<span class="ot">sumLambda ::</span> [<span class="dt">Integer</span>] <span class="ot">-&gt;</span> <span class="dt">Integer</span>
sumLambda <span class="fu">=</span> foldl (\acc x <span class="ot">-&gt;</span> acc <span class="fu hl">+</span> x) <span class="dv">0</span></code></pre>

# Functions & Lambdas {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="ot">add ::</span> <span class="dt">Integer</span> <span class="ot">-&gt;</span> <span class="dt">Integer</span> <span class="ot">-&gt;</span> <span class="dt">Integer</span>
add acc <span class="hl">x</span> <span class="fu">=</span> <span class="fu">(+)</span> acc <span class="hl">x</span>

<span class="ot">sumFun ::</span> [<span class="dt">Integer</span>] <span class="ot">-&gt;</span> <span class="dt">Integer</span>
sumFun <span class="fu">=</span> foldl add <span class="dv">0</span>

<span class="ot">sumLambda ::</span> [<span class="dt">Integer</span>] <span class="ot">-&gt;</span> <span class="dt">Integer</span>
sumLambda <span class="fu">=</span> foldl (\acc <span class="hl">x</span> <span class="ot">-&gt;</span> <span class="fu">(+)</span> acc <span class="hl">x</span>) <span class="dv">0</span></code></pre>

# Functions & Lambdas {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="ot">add ::</span> <span class="dt">Integer</span> <span class="ot">-&gt;</span> <span class="dt">Integer</span> <span class="ot">-&gt;</span> <span class="dt">Integer</span>
add <span class="hl">acc</span> <span class="fu">=</span> <span class="fu">(+)</span> <span class="hl">acc</span>

<span class="ot">sumFun ::</span> [<span class="dt">Integer</span>] <span class="ot">-&gt;</span> <span class="dt">Integer</span>
sumFun <span class="fu">=</span> foldl add <span class="dv">0</span>

<span class="ot">sumLambda ::</span> [<span class="dt">Integer</span>] <span class="ot">-&gt;</span> <span class="dt">Integer</span>
sumLambda <span class="fu">=</span> foldl (\<span class="hl">acc</span> <span class="ot">-&gt;</span> <span class="fu">(+)</span> <span class="hl">acc</span>) <span class="dv">0</span></code></pre>

# Functions & Lambdas {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="ot">add ::</span> <span class="dt">Integer</span> <span class="ot">-&gt;</span> <span class="dt">Integer</span> <span class="ot">-&gt;</span> <span class="dt">Integer</span>
add <span class="fu">=</span> <span class="fu">(+)</span>

<span class="ot">sumFun ::</span> [<span class="dt">Integer</span>] <span class="ot">-&gt;</span> <span class="dt">Integer</span>
sumFun <span class="fu">=</span> foldl add <span class="dv">0</span>

<span class="ot">sumLambda ::</span> [<span class="dt">Integer</span>] <span class="ot">-&gt;</span> <span class="dt">Integer</span>
sumLambda <span class="fu">=</span> foldl <span class="fu">(+)</span> <span class="dv">0</span></code></pre>

# Guards {.big-code}

```erlang
-spec is_negative(number()) -> boolean().
is_negative(X) when X < 0 ->
  true;
is_negative(_) ->
  false.
```

# Guards {.big-code}

```haskell
isNegative :: (Num a) => a -> Bool
isNegative x
  | x < 0     = True
  | otherwise = False
```

# Built-in types {.big-code .small-title}

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

# Lists & Tuples {.big-code .small-title}

```erlang
some_list() ->
    [1, 2, 3].

some_other_list() ->
    [4 | [5 | [6 | []]]].

some_tuple() ->
    {10, $4}.

some_string() ->
    "foo".
```

# Lists & Tuples {.big-code .small-title}

```haskell
-- [a], type can be written prefix as `[] a`
someList, someOtherList :: [Int]
someList = [1, 2, 3]
someOtherList = 4 : 5 : 6 : []
dontWriteThis = (:) 4 (5 : (:) 6 [])

-- (a, b), can be written prefix as `(,) a b`
someTuple, someOtherTuple :: (Int, Char)
someTuple = (10, '4')
someOtherTuple = (,) 4 '2'

-- [Char], also known as String
-- (also see the OverloadedStrings extension)
someString :: String
someString = "foo"
```

# Typeclass Syntax {.big-code}

* Erlang doesn't have typeclasses.

* Elixir has Protocols, which are closer,
  but they are also not typeclasses.

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

# Typeclass Syntax {.big-code}

```haskell
{-
class Eq a where
  (==) :: a -> a -> Bool
-}

instance Eq Choice where
  Definitely == Definitely = True
  Possibly   == Possibly   = True
  NoWay      == NoWay      = True
  _          == _          = False
```

# Typeclass Syntax {.big-code}

```haskell
data Choice = Definitely
            | Possibly
            | NoWay
            deriving (Eq)
```

# Typeclass Syntax {.big-code}

```haskell
data Choice = Definitely
            | Possibly
            | NoWay
            deriving ( Eq, Ord, Enum, Bounded
                     , Show, Read )
```

# QuickCheck {.big-code}

```erlang
prop_itsthere() ->
    ?FORALL(I,int(),
        [I] == queue:to_list(
            queue:cons(I,
                queue:new()))).
```

# QuickCheck {.big-code}

```haskell
import Data.Sequence ((|>), empty)
import Data.Foldable (toList)

prop_itsthere :: Int -> Bool
prop_itsthere i = [i] == toList (empty |> i)
```

# QuickCheck {.big-code}

```bash
$ ghci
```
```haskell
λ> import Test.QuickCheck
λ> import Data.Foldable
λ> import Data.Sequence
λ> quickCheck (\i -> [i :: Int] ==
                       toList (empty |> i))
+++ OK, passed 100 tests.
```

# Do syntax {.big-code .highlight}

<!--
```erlang
-spec main([string()]) -> ok.
main(_Args) ->
    {ok, Secret} = file:read_file("/etc/passwd"),
    file:write_file("/tmp/passwd", Secret),
    ok.
```
-->

<pre class="sourceCode erlang"><code class="sourceCode erlang"><span class="kw">-</span><span class="ch">spec</span> <span class="fu">main([string()])</span> <span class="kw">-&gt;</span> <span class="ch">ok</span><span class="fu">.</span>
<span class="fu">main(</span><span class="dt">_Args</span><span class="fu">)</span> <span class="kw">-&gt;</span>
  <span class="fu">{</span><span class="ch">ok</span><span class="fu">,</span> <span class="dt">Secret</span><span class="fu">}</span> <span class="kw">=</span> <span class="fu">file:read_file(</span><span class="st">"/etc/passwd"</span><span class="fu">)<span class="hl">,</span></span>
  <span class="fu">file:write_file(</span><span class="st">"/tmp/passwd"</span><span class="fu">,</span> <span class="dt">Secret</span><span class="fu">)<span class="hl">,</span></span>
  <span class="ch">ok</span><span class="fu"><span class="hl">.</span></span></code></pre>

# Do syntax (IO) {.big-code}

```haskell
main :: IO ()
main = do
  secret <- readFile "/etc/passwd"
  writeFile "/tmp/passwd" secret
  return ()
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

# Do syntax (IO) {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="ot">main ::</span> <span class="dt">IO</span> ()
main <span class="fu">=</span> <span class="hl"><span class="kw">do</span></span>
  <span class="hl">secret <span class="ot">&lt;-</span></span> readFile <span class="st">"/etc/passwd"</span>
  writeFile <span class="st">"/tmp/passwd"</span> secret
  return ()</code></pre>

# Do syntax (IO) {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="ot">main ::</span> <span class="dt">IO</span> ()
main <span class="fu">=</span>
  readFile <span class="st">"/etc/passwd"</span> <span class="hl">&gt;&gt;= \secret -> do</span>
  writeFile <span class="st">"/tmp/passwd"</span> secret
  return ()</code></pre>

# Do syntax (IO) {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="ot">main ::</span> <span class="dt">IO</span> ()
main <span class="fu">=</span>
  readFile <span class="st">"/etc/passwd"</span> <span class="fu">&gt;&gt;=</span> \secret <span class="ot">-></span>
  writeFile <span class="st">"/tmp/passwd"</span> secret <span class="hl">&gt;&gt;</span>
  return ()</code></pre>

# Do syntax (IO) {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="ot">main ::</span> <span class="dt">IO</span> ()
main <span class="fu">=</span>
  readFile <span class="st">"/etc/passwd"</span> <span class="fu">&gt;&gt;=</span><span class="hl"> \secret <span class="ot">-></span></span>
  writeFile <span class="st">"/tmp/passwd"</span> <span class="hl">secret</span></code></pre>

# Do syntax (IO) {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="ot">main ::</span> <span class="dt">IO</span> ()
main <span class="fu">=</span>
  readFile <span class="st">"/etc/passwd"</span> <span class="fu">&gt;&gt;=</span>
  writeFile <span class="st">"/tmp/passwd"</span></code></pre>

# Do syntax ([a]) {.big-code}

```erlang
-spec flat_map(fun((A) -> [B]), [A]) -> [B] when
  A :: term(),
  B :: term().
flat_map(F, Xs) -> [ Y || X <- Xs, Y <- F(X) ].
```

# Do syntax ([a]) {.big-code}

```haskell
flatMap :: (a -> [b]) -> [a] -> [b]
flatMap f xs = [ y | x <- xs, y <- f x ]
```

# Do syntax ([a]) {.big-code}

```haskell
flatMap :: (a -> [b]) -> [a] -> [b]
flatMap f xs = do
  x <- xs
  y <- f x
  return y
```

# Do syntax ([a]) {.big-code}

```haskell
flatMap :: (a -> [b]) -> [a] -> [b]
flatMap f xs = do
  x <- xs
  f x
```

# Do syntax ([a]) {.big-code}

```haskell
flatMap :: (a -> [b]) -> [a] -> [b]
flatMap f xs = xs >>= \x -> f x
```

# Do syntax ([a]) {.big-code}

```haskell
flatMap :: (a -> [b]) -> [a] -> [b]
flatMap f xs = xs >>= f
```

# Do syntax ([a]) {.big-code}

```haskell
flatMap :: (a -> [b]) -> [a] -> [b]
flatMap f xs = flip (>>=) f xs
```

# Do syntax ([a]) {.big-code}

```haskell
flatMap :: (a -> [b]) -> [a] -> [b]
flatMap = flip (>>=)
```

# Do syntax ([a]) {.big-code}

```haskell
flatMap :: (a -> [b]) -> [a] -> [b]
flatMap = (=<<)
```

# Key Features

* Interactive
* Pure
* Non-strict (lazy) evaluation
* Types and typeclasses
* Abstractions
* Multi-paradigm

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

# {#ghci-i-typeclass .big-code}

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

# GHC RULES {.big-code}

```haskell

{-# RULES
"ByteString specialise break (x==)" forall x.
    break ((==) x) = breakByte x
"ByteString specialise break (==x)" forall x.
    break (==x) = breakByte x
  #-}

import Data.ByteString.Char8 (ByteString, break)

splitLine :: ByteString -> (ByteString, ByteString)
splitLine = break (=='\n')
```

# GHC RULES {.big-code}

```haskell

{-# RULES
"ByteString specialise break (x==)" forall x.
    break ((==) x) = breakByte x
"ByteString specialise break (==x)" forall x.
    break (==x) = breakByte x
  #-}

import Data.ByteString.Char8 (ByteString, break)

splitLine :: ByteString -> (ByteString, ByteString)
splitLine = breakByte '\n'
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

# Non-Strict Evaluation {.big-code}

```haskell
-- [1..] is an infinite list, [1, 2, 3, ...]
print (head (map (*2) [1..]))
```

# Non-Strict Evaluation {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="co">-- [1..] is an infinite list, [1, 2, 3, ...]</span>
<span class="hl">print (</span>head (map (<span class="fu">*</span><span class="dv">2</span>) [<span class="dv">1</span><span class="fu">..</span>])<span class="hl">)</span>
<span class="co">-- Outside in, print x = putStrLn (show x)</span>
<span class="hl">putStrLn (show (</span>head (map (<span class="fu">*</span><span class="dv">2</span>) [<span class="dv">1</span><span class="fu">..</span>]<span class="hl">))</span></code></pre>

# Non-Strict Evaluation {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="co">-- Outside in, print x = putStrLn (show x)</span>
putStrLn (show (<span class="hl2">head (<span class="hl1">map (<span class="fu">*</span><span class="dv">2</span>) <span class="hl">[<span class="dv">1</span><span class="fu">..</span>]</span>)</span>)</span>
<span class="co">-- head (x:_) = x</span>
<span class="co">-- map f (x:xs) = f x : map f xs</span>
<span class="co">-- desugar [1..] syntax</span>
putStrLn (show (head (map (<span class="fu">*</span><span class="dv">2</span>) (<span class="hl">enumFrom <span class="dv">1</span></span>))))</code></pre>

# Non-Strict Evaluation {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="co">-- desugar [1..] syntax</span>
putStrLn (show (head (map (<span class="fu">*</span><span class="dv">2</span>) (<span class="hl">enumFrom <span class="dv">1</span></span>))))
<span class="co">-- enumFrom n = n : enumFrom (succ n)</span>
putStrLn (show (head (map (<span class="fu">*</span><span class="dv">2</span>)
                          (<span class="hl"><span class="dv">1</span> <span class="fu">:</span> enumFrom (succ <span class="dv">1</span>)</span>))))</code></pre>

# Non-Strict Evaluation {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="co">-- enumFrom n = n : enumFrom (succ n)</span>
putStrLn (show (head (<span class="hl1">map (<span class="fu">*</span><span class="dv">2</span>)</span>
                          <span class="hl1">(<span class="hl"><span class="dv">1</span> <span class="fu">:</span></span> enumFrom (succ <span class="dv">1</span>))</span>)))
<span class="co">-- apply map</span>
putStrLn (show (head
                  (<span class="hl">(<span class="dv">1</span><span class="fu">*</span><span class="dv">2</span>) <span class="fu">:</span></span>
                   <span class="hl1">map (<span class="fu">*</span><span class="dv">2</span>) (enumFrom (succ <span class="dv">1</span>))</span>)))</code></pre>

# Non-Strict Evaluation {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="co">-- apply map</span>
putStrLn (show (<span class="hl1">head (<span class="hl">(<span class="dv">1</span><span class="fu">*</span><span class="dv">2</span>)</span> <span class="fu">:</span> …)</span>))
<span class="co">-- apply head</span>
putStrLn (show <span class="hl">(<span class="dv">1</span><span class="fu">*</span><span class="dv">2</span>)</span>)</code></pre>

# Non-Strict Evaluation {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="co">-- apply head</span>
putStrLn (show <span class="hl">(<span class="dv">1</span><span class="fu">*</span><span class="dv">2</span>)</span>)
<span class="co">-- show pattern matches on its argument</span>
putStrLn (show <span class="hl"><span class="dv">2</span></span>)</code></pre>

# Non-Strict Evaluation {.big-code .highlight}

<pre class="sourceCode haskell"><code class="sourceCode haskell"><span class="co">-- show pattern matches on its argument</span>
putStrLn (<span class="hl">show <span class="dv">2</span></span>)
<span class="co">-- apply show</span>
putStrLn <span class="hl"><span class="st">"2"</span></span></code></pre>

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

+-------------+-------------------------------------------------+
| **Slides**  | [bob.ippoli.to/haskell-for-erlangers-2014]      |
+-------------+-------------------------------------------------+
| **Source**  | [github.com/etrepum/haskell-for-erlangers-2014] |
+-------------+-------------------------------------------------+
| **Email**   | bob@redivi.com                                  |
+-------------+-------------------------------------------------+
| **Twitter** | [&#64;etrepum](https://twitter.com/etrepum)     |
+-------------+-------------------------------------------------+

<!--
Other interesting presentations:
http://shuklan.com/haskell/lec01.html
http://ugcs.net/~keegan/talks/why-learn-haskell/talk.pdf

TODO
http://www.haskell.org/haskellwiki/Learn_Haskell_in_10_minutes
http://www.haskell.org/tutorial/goodies.html

-->

[bob.ippoli.to/haskell-for-erlangers-2014]: http://bob.ippoli.to/haskell-for-erlangers-2014/
[github.com/etrepum/haskell-for-erlangers-2014]: https://github.com/etrepum/haskell-for-erlangers-2014
[hdevtools]: https://github.com/bitc/hdevtools
[ghc-mod]: http://www.mew.org/~kazu/proj/ghc-mod/en/
[HLint]: http://community.haskell.org/~ndm/hlint/
[Pandoc]: http://johnmacfarlane.net/pandoc/
