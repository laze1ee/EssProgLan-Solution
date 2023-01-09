<TeXmacs|2.1.2>

<style|<tuple|EssProgLan|pagella-font>>

<\body>
  <chapter|Inductive Sets of Data>

  <section|Recursively Specified Data>

  <\exercise>
    Write inductive definitions of the following sets. Write each definition
    in all three styles (top-down, bottom-up, and rules of inference). Using
    your rules, show the derivation of some sample elements of each set.

    <\enumerate-numeric>
      <item><math|<around*|{|3n+2<space|0.5em><mid|\|><space|0.5em>n\<in\>N|}>>

      <item><math|<around*|{|2n+3m+1<space|0.5em><mid|\|><space|0.5em>n,m\<in\>N|}>>

      <item><math|<around*|{|<around*|(|n,2n+1|)><space|0.5em><mid|\|><space|0.5em>n\<in\>N|}>>

      <item><math|<around*|{|<around*|(|n,n<rsup|2>|)><space|0.5em><mid|\|><space|0.5em>n\<in\>N|}>>
      Do not mention squaring in your rules. As a hint, remember the equation
      <math|<around*|(|n+1|)><rsup|2>=n<rsup|2>+2n+1.>
    </enumerate-numeric>

    <\solution*>
      \;

      <strong|<em|note:>> <math|\<Downarrow\>> is <strong|top-down>,
      <math|\<Uparrow\>> is <strong|bottom-up>, <math|\<Rightarrow\>> is
      <strong|rules of inference>.

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|1|1|cell-width|6spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|2|2|cell-width|8spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|-1|3|3|cell-lsep|4spc>|<cwith|5|7|2|2|cell-halign|c>|<cwith|5|7|2|2|cell-width|8spc>|<cwith|5|7|2|2|cell-hmode|exact>|<cwith|9|11|2|2|cell-halign|c>|<cwith|9|11|2|2|cell-width|8spc>|<cwith|9|11|2|2|cell-hmode|exact>|<cwith|9|11|2|2|cell-halign|c>|<cwith|9|11|2|2|cell-width|8spc>|<cwith|9|11|2|2|cell-hmode|exact>|<cwith|13|15|2|2|cell-halign|c>|<cwith|13|15|2|2|cell-width|8spc>|<cwith|13|15|2|2|cell-hmode|exact>|<cwith|13|15|2|2|cell-halign|c>|<cwith|13|15|2|2|cell-width|8spc>|<cwith|13|15|2|2|cell-hmode|exact>|<table|<row|<\cell>
          1.
        </cell>|<\cell>
          <math|\<Downarrow\>>
        </cell>|<\cell>
          <math|x=2,<infix-or> x-3\<in\>S>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|\<Uparrow\>>
        </cell>|<\cell>
          <math|2\<in\>S,<infix-and><space|1em>if x\<in\>S,then x+3\<in\>S>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|\<Rightarrow\>>
        </cell>|<\cell>
          <math|2\<in\>S<space|2em><dfrac|x\<in\>S|x+3\<in\>S>>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          2.
        </cell>|<\cell>
          <math|\<Downarrow\>>
        </cell>|<\cell>
          <math|x=1,either<infix-or>both <around*|[|x-2\<in\>S,x-3\<in\>S|]>>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|\<Uparrow\>>
        </cell>|<\cell>
          <math|1\<in\>S,<infix-and><space|1em>if
          x\<in\>S,either<infix-or>both<around*|[|x+2\<in\>S,x+3\<in\>S|]>>\ 
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|\<Rightarrow\>>
        </cell>|<\cell>
          <math|1\<in\>S<space|2em><dfrac|x\<in\>S|either<infix-or>both<around*|[|x+2\<in\>S,x+3\<in\>S|]>>>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          3.
        </cell>|<\cell>
          <math|\<Downarrow\>>
        </cell>|<\cell>
          <math|x=0,y=1,<infix-or><around*|(|x-1,y-2|)>\<in\>S>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|\<Uparrow\>>
        </cell>|<\cell>
          <math|<around*|(|0,1|)>\<in\>S,<infix-and><space|1em>if
          <around*|(|x,y|)>\<in\>S then <around*|(|x+1,y+2|)>\<in\>S>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|\<Rightarrow\>>
        </cell>|<\cell>
          <math|<around*|(|0,1|)>\<in\>S<space|2em><dfrac|<around*|(|x,y|)>\<in\>S|<around*|(|x+1,y+2|)>\<in\>S>>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          4.
        </cell>|<\cell>
          <math|\<Downarrow\>>
        </cell>|<\cell>
          <math|x=0,y=0,<infix-or><around*|(|x-1,y-x|)>\<in\>S>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|\<Uparrow\>>
        </cell>|<\cell>
          <math|<around*|(|0,0|)>\<in\>S,<infix-and> \ if
          <around*|(|x,y|)>\<in\>S then <around*|(|x+1,y+2x+1|)>\<in\>S>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|\<Rightarrow\>>
        </cell>|<\cell>
          <math|<around*|(|0,0|)>\<in\>S<space|2em><dfrac|<around*|(|x,y|)>\<in\>S|<around*|(|x+1,y+2x+1|)>\<in\>S>>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    What sets are defined by the following pairs of rules? Explain why.

    <\enumerate-numeric>
      <item><math|<around*|(|0,1|)>\<in\>S<space|2em><dfrac|<around*|(|n,k|)>\<in\>S|<around*|(|n+1,k+7|)>\<in\>S>>

      <item><math|<around*|(|0,1|)>\<in\>S<space|2em><dfrac|<around*|(|n,k|)>\<in\>S|<around*|(|n+1,2k|)>\<in\>S>>

      <item><math|<around*|(|0,0,1|)>\<in\>S<space|2em><dfrac|<around*|(|n,i,j|)>\<in\>S|<around*|(|n+1,j,i+j|)>\<in\>S>>

      <item><math|<around*|(|0,1,0|)>\<in\>S<space|2em><dfrac|<around*|(|n,i,j|)>\<in\>S|<around*|(|n+1,i+2,i+j|)>\<in\>S>>
    </enumerate-numeric>

    <\solution*>
      \;

      <\enumerate-numeric>
        <item><math|<around*|{|<around*|(|n,7n+1|)><space|0.5em><mid|\|><space|0.5em>n\<in\>N|}>>

        <item><math|<around*|{|<around*|(|n,2<rsup|n>|)><space|0.5em><mid|\|><space|0.5em>n\<in\>N|}>>

        <item><math|<around*|{|<around*|(|n,f i b<around*|(|n|)>,f i
        b<around*|(|n+1|)>|)><space|0.5em><mid|\|><space|0.5em>n\<in\>N|}>>

        <item><math|<around*|{|<around*|(|n,2n+1,n<rsup|2>|)><space|0.5em><mid|\|><space|0.5em>n\<in\>N|}>>
      </enumerate-numeric>
    </solution*>
  </exercise>

  <\exercise>
    Find a set <math|T> of natural numbers such that <math|0\<in\>T>, and
    whenever <math|n\<in\>T>, then <math|n+3\<in\>T>, but <math|T\<neq\>S>,
    where <math|S> is the set defined in definition 1.1.2.

    <\solution*>
      \;

      <math|T=N>
    </solution*>
  </exercise>

  <\exercise>
    Write a derivation from <em|List-of-Int> to <verbatim|(-7 . (3 . (14 .
    ())))>.

    <\solution*>
      \;

      <tabular|<tformat|<table|<row|<cell|>|<cell|<em|List-of-Int>>>|<row|<cell|<math|\<Rightarrow\>>>|<cell|<verbatim|(Int
      . List-of-Int)>>>|<row|<cell|<math|\<Rightarrow\>>>|<cell|<verbatim|(-7
      . List-of-Int)>>>|<row|<cell|<math|\<Rightarrow\>>>|<cell|<verbatim|(-7
      . (Int . List-of-Int))>>>|<row|<cell|<math|\<Rightarrow\>>>|<cell|<verbatim|(-7
      . (3 . List-of-Int))>>>|<row|<cell|<math|\<Rightarrow\>>>|<cell|<verbatim|(-7
      . (3 . (Int . List-of-Int)))>>>|<row|<cell|<math|\<Rightarrow\>>>|<cell|<verbatim|(-7
      . (3 . (14 . List-of-Int)))>>>|<row|<cell|<math|\<Rightarrow\>>>|<cell|<verbatim|(-7
      . (3 . (14 . ())))>>>>>>
    </solution*>
  </exercise>

  <\exercise>
    Prove that if <math|e\<in\>L c E x p>, then there are the same number of
    left and right parentheses in <math|e>.

    <\solution*>
      \;

      <\enumerate-numeric>
        <item><em|Identifier> has 0 parenthes.

        <item>Other <em|LcExp> have matched pair parentheses.
      </enumerate-numeric>
    </solution*>
  </exercise>

  <section|Deriving Recursive Programs>

  <\exercise>
    If we reversed the order of the tests in nth-element, what would go
    wrong?

    <\solution*>
      \;

      Jump over empty list check, <verbatim|car> may operate a empty list.
    </solution*>
  </exercise>

  <\exercise>
    The error message from <verbatim|nth-element> is uninformative. Rewrite
    <verbatim|nth-element> so that it produces a more informative error
    message, such as \P<verbatim|(a b c)> does not have 8 elements.\Q

    <\solution*>
      \;

      See source code file in \Psection-1.2/1.7.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    In the definition of <verbatim|remove-first>, if the last line were
    replaced by <verbatim|(remove-first s (cdr los))>, what function would
    the resulting procedure compute? Give the contract, including the usage
    statement, for the revised procedure.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<twith|table-width|1par>|<twith|table-hmode|exact>|<table|<row|<\cell>
          <strong|procedure:>
        </cell>|<\cell>
          <block|<tformat|<cwith|1|-1|1|-1|cell-lborder|0ln>|<cwith|1|-1|1|-1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-bborder|0ln>|<cwith|1|-1|1|-1|cell-tborder|0ln>|<cwith|1|-1|1|-1|cell-bsep|0sep>|<cwith|1|-1|1|-1|cell-tsep|0sep>|<cwith|1|-1|1|-1|cell-rsep|4spc>|<cwith|1|-1|1|-1|cell-lsep|0spc>|<cwith|1|1|2|-1|cell-halign|r>|<cwith|1|-1|2|4|cell-halign|r>|<table|<row|<cell|<verbatim|(remove-first>>|<cell|<verbatim|s>>|<cell|<verbatim|ls>>|<cell|<verbatim|)>>>|<row|<cell|>|<cell|<em|<strong|Symbol>>>|<cell|<em|<strong|List>>>|<cell|>>>>>
        </cell>>|<row|<\cell>
          <strong|return:>
        </cell>|<\cell>
          <em|<strong|List>>
        </cell>>|<row|<\cell>
          <strong|specification:>
        </cell>|<\cell>
          Remove the first element same as <verbatim|s> and before elements,
          return remained list.
        </cell>>|<row|<\cell>
          <strong|define:>
        </cell>|<\cell>
          <\scm-code>
            (define remove-first

            \ \ (lambda (s ls)

            \ \ \ \ (cond

            \ \ \ \ \ \ [(null? ls) '()]

            \ \ \ \ \ \ [(eq? s (car ls)) (cdr ls)]

            \ \ \ \ \ \ [else

            \ \ \ \ \ \ \ (remove-first s (cdr ls))])))
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Define <verbatim|remove>, which is like <verbatim|remove-first>, except
    that it removes all occurrences of a given symbol from a list of symbols,
    not just the first.

    <\solution*>
      \;

      See source code file in \Psection-1.2/1.9.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    We typically use \Por\Q to mean \Pinclusive or.\Q What other meanings can
    \Por\Q have?

    <\solution*>
      \;

      either, otherwise.
    </solution*>
  </exercise>

  <\exercise>
    In the last line of <verbatim|subst-in-s-exp>, the recursion is on
    <verbatim|sexp> and not a smaller substructure. Why is the recursion
    guaranteed to halt?

    <\solution*>
      \;

      Main recursion in <verbatim|subst>, whatever <verbatim|subst-in-s-exp>
      call, they will halt in <verbatim|subst>.
    </solution*>
  </exercise>

  <\exercise>
    Eliminate the one call to <verbatim|subst-in-s-exp> in <verbatim|subst>
    by replacing it by its definition and simplifying the resulting
    procedure. The result will be a version of <verbatim|subst> that does not
    need <verbatim|subst-in-s-exp>. This technique is called inlining, and is
    used by optimizing compilers.

    <\solution*>
      \;

      See source code file in \Psection-1.2/1.12.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    In our example, we began by eliminating the Kleene star in the grammar
    for <verbatim|S-list>. Write <verbatim|subst> following the original
    grammar by using <verbatim|map>.

    <\solution*>
      \;

      See source code file in \Psection-1.2/1.13.rkt\Q.
    </solution*>
  </exercise>

  <section|Auxiliary Procedures and Context Arguments>

  <\exercise>
    Given the assumption <math|0\<leqslant\>n\<less\>l e n g t h(v)>, prove
    that <verbatim|partial-vector-sum> is correct.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <strong|Initialization:> Cause <math|0\<leqslant\>n\<less\>length(v)>,
          first add the nth-integer <math|v<rsub|n>> of <verbatim|v> to
          recusive chain. (+ <math|v<rsub|n>> (<em|partial-vector-sum>
          <math|v> (- <math|n> 1)))
        </cell>>|<row|<\cell>
          <tabular|<tformat|<cwith|1|2|1|1|cell-lsep|0>|<cwith|1|-1|1|-1|cell-tsep|2sep>|<cwith|1|-1|1|-1|cell-bsep|1sep>|<table|<row|<cell|<strong|Maintenance:
          >>|<cell|(+ <math|v<rsub|n>> (<em|partial-vector-sum> <math|v> (-
          <math|n> 1)))>>|<row|<cell|>|<cell|(+ <math|v<rsub|n>> (+
          <math|v<rsub|n-1>> (<em|partial-vector-sum> <math|v> (- <math|n>
          2))))>>|<row|<cell|>|<cell|(+ <math|v<rsub|n>> (+
          <math|v<rsub|n-1>> (+ <math|v<rsub|n-2 >> (<em|partial-vector-sum>
          <math|v> (- <math|n> 3))))>>|<row|<cell|>|<cell|<math|\<vdots\>>>>>>>
        </cell>>|<row|<\cell>
          <strong|Termination:> When <math|n=0>, return <math|v<rsub|0>>, get
          the result of recusive chain:
        </cell>>|<row|<\cell>
          <space|6.5em>(+ <math|v<rsub|n>> (+ <math|v<rsub|n-1>> (+
          <math|v<rsub|n-2 >> (+ <math|v<rsub|n-3>> <math|\<ldots\>>
          <math|v<rsub|0>> ))))
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <section|Exercises>

  <\exercise>
    <verbatim|(duple n x)> returns a list containing n copies of
    <verbatim|x>.

    <tabular|<tformat|<twith|table-tsep|0>|<cwith|1|-1|1|-1|cell-valign|B>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(duple
    2 3)>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(3
    3)>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(duple 4
    '(ha ha))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|((ha ha) (ha ha) (ha
    ha) (ha ha))>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(duple
    0 '(blah))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|()>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.15.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(invert lst)>, where lst is a list of 2-lists (lists of length
    two), returns a list with each 2-list reversed.

    <tabular|<tformat|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(invert
    '((a 1) (a 2) (1 b) (2 b)))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|((1
    a) (2 a) (b 1) (b 2))>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.16.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(down lst)> wraps parentheses around each top-level element of
    <verbatim|lst>.

    <tabular|<tformat|<twith|table-tsep|0>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(down
    '(1 2 3))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|((1) (2)
    (3))>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(down
    '((a) (fine) (idea)))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(((a))
    ((fine)) ((idea)))>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(down
    '(a (more (complicated)) object))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|((a)
    ((more (complicated))) (object))>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.17.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(swapper s1 s2 slist)> returns a list the same as
    <verbatim|slist>, but with all occurrences of <verbatim|s1> replaced by
    <verbatim|s2> and all occurrences of <verbatim|s2> replaced by
    <verbatim|s1>.

    <tabular|<tformat|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(swapper
    'a 'd '(a b c d))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(d b c
    a)>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(swapper 'a
    'd '(a d () c d))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(d a () c
    a)>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(swapper 'x
    'y '((x) y (z (x))))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|((y) x (z
    (y)))>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.18.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(list-set lst n x)> returns a list like <verbatim|lst>, except
    that the n-th element, using zero-based indexing, is <verbatim|x>.

    <tabular|<tformat|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(list-set
    '(a b c d) 2 '(1 2))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(a b (1 2)
    d)>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(list-ref
    (list-set '(a b c d) 3 '(1 5 10)) 3)>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(1
    5 10)>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.19.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(count-occurrences s slist)> returns the number of occurrences
    of <verbatim|s> in <verbatim|slist>.

    <tabular|<tformat|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(count-occurrences
    'x '((f x) y (((x z) x))))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|3>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(count-occurrences
    'x '((f x) y (((x z) () x))))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|3>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(count-occurrences
    'w '((f x) y (((x z) x))))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|0>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.20.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(product sos1 sos2)>, where <verbatim|sos1> and <verbatim|sos2>
    are each a list of symbols without repetitions, returns a list of 2-lists
    that represents the Cartesian product of <verbatim|sos1> and
    <verbatim|sos2>. The 2-lists may appear in any order.

    <tabular|<tformat|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(product
    '(a b c) '(x y))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|((a x) (a y) (b
    x) (b y) (c x) (c y))>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.21.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(filter-in pred lst)> returns the list of those elements in
    <verbatim|lst> that satisfy the predicate pred.

    <tabular|<tformat|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(filter-in
    number? '(a 2 (1 3) b 7))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(2
    7)>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(filter-in
    symbol? '(a (b c) 17 foo))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(a
    foo)>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.22.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(list-index pred lst)> returns the 0-based position of the
    first element of <verbatim|lst> that satisfies the predicate pred. If no
    element of lst satisfies the predicate, then <verbatim|list-index>
    returns <verbatim|#f>.

    <tabular|<tformat|<cwith|1|-1|1|-1|cell-hyphen|n>|<cwith|1|-1|1|-1|cell-block|auto>|<cwith|1|-1|1|-1|cell-valign|c>|<twith|table-valign|f>|<cwith|1|-1|1|-1|cell-bsep|1spc>|<cwith|1|-1|1|-1|cell-lsep|1spc>|<cwith|1|-1|1|-1|cell-rsep|1spc>|<cwith|1|-1|1|-1|cell-tsep|1spc>|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(list-index
    number? '(a 2 (1 3) b 7))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|1>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(list-index
    symbol? '(a (b c) 17 foo))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|0>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(list-index
    symbol? '(1 2 (a b) 3))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|#f>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.23.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(every? pred lst)> returns <verbatim|#f> if any element of
    <verbatim|lst> fails to satisfy <verbatim|pred>, and returns
    <verbatim|#t> otherwise.

    <tabular|<tformat|<cwith|1|4|1|3|cell-hyphen|n>|<cwith|1|4|1|3|cell-block|auto>|<cwith|1|4|1|3|cell-lsep|1spc>|<cwith|1|4|1|3|cell-rsep|1spc>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|-1|1|-1|cell-tsep|1spc>|<cwith|1|-1|1|-1|cell-bsep|1spc>|<twith|table-valign|f>|<cwith|1|-1|1|-1|cell-vcorrect|a>|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(every?
    number? '(a b c 3 e))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|#f>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(every?
    number? '(1 2 3 5 4))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|#t>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.24.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(exists? pred lst)> returns <verbatim|#t> if any element of
    <verbatim|lst> satisfies <verbatim|pred>, and returns <verbatim|#f>
    otherwise.

    <tabular|<tformat|<cwith|1|4|1|3|cell-hyphen|n>|<cwith|1|4|1|3|cell-block|auto>|<cwith|1|4|1|3|cell-lsep|1spc>|<cwith|1|4|1|3|cell-rsep|1spc>|<cwith|1|4|1|3|cell-valign|c>|<cwith|1|4|1|3|cell-tsep|1spc>|<cwith|1|4|1|3|cell-bsep|1spc>|<cwith|1|4|1|3|cell-vcorrect|a>|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(exists?
    number? '(a b c 3 e))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|#t>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(exists?
    number? '(a b c d e))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|#f>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.25.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(up lst)> removes a pair of parentheses from each top-level
    element of <verbatim|lst>. If a top-level element is not a list, it is
    included in the result, as is. The value of <verbatim|(up (down lst))> is
    equivalent to <verbatim|lst>, but <verbatim|(down (up lst))> is not
    necessarily lst. (See exercise 1.17.)

    <tabular|<tformat|<cwith|1|4|1|3|cell-hyphen|n>|<cwith|1|4|1|3|cell-block|auto>|<cwith|1|4|1|3|cell-valign|c>|<cwith|1|4|1|3|cell-vcorrect|a>|<twith|table-tsep|2spc>|<cwith|1|-1|1|-1|cell-rsep|1spc>|<cwith|1|-1|1|-1|cell-tsep|1spc>|<cwith|1|-1|1|-1|cell-bsep|1spc>|<cwith|1|-1|1|-1|cell-lsep|1spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(up
    '((1 2) (3 4)))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(1 2 3
    4)>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(up '((x
    (y)) z))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(x (y) z)>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.26.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(flatten slist)> returns a list of the symbols contained in
    <verbatim|slist> in the order in which they occur when <verbatim|slist>
    is printed. Intuitively, <verbatim|flatten> removes all the inner
    parentheses from its argument.

    <tabular|<tformat|<cwith|1|4|1|3|cell-hyphen|n>|<cwith|1|4|1|3|cell-block|auto>|<cwith|1|4|1|3|cell-valign|c>|<cwith|1|4|1|3|cell-vcorrect|a>|<cwith|1|4|1|3|cell-rsep|1spc>|<cwith|1|4|1|3|cell-tsep|1spc>|<cwith|1|4|1|3|cell-bsep|1spc>|<cwith|1|4|1|3|cell-lsep|1spc>|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(flatten
    '(a b c))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(a b
    c)>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(flatten
    '((a) () (b ()) () (c)))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(a b
    c)>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(flatten
    '((a b) c (((d)) e)))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(a b c d
    e)>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(a b
    c)>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.27.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(merge loi1 loi2)>, where <verbatim|loi1> and <verbatim|loi2>
    are lists of integers that are sorted in ascending order, returns a
    sorted list of all the integers in <verbatim|loi1> and <verbatim|loi2>.

    <tabular|<tformat|<cwith|1|4|1|3|cell-hyphen|n>|<cwith|1|4|1|3|cell-block|auto>|<cwith|1|4|1|3|cell-valign|c>|<cwith|1|4|1|3|cell-vcorrect|a>|<cwith|1|4|1|3|cell-rsep|1spc>|<cwith|1|4|1|3|cell-tsep|1spc>|<cwith|1|4|1|3|cell-bsep|1spc>|<cwith|1|4|1|3|cell-lsep|1spc>|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(merge
    '(1 4) '(1 2 8))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(1 1 2 4
    8)>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(merge '(35
    62 81 90 91) '(3 83 85 90))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(3 35
    62 81 83 85 90 90 91)>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.28.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(sort loi)> returns a list of the elements of <verbatim|loi> in
    ascending order.

    <tabular|<tformat|<cwith|1|2|1|3|cell-hyphen|n>|<cwith|1|2|1|3|cell-block|auto>|<cwith|1|2|1|3|cell-valign|c>|<cwith|1|2|1|3|cell-vcorrect|a>|<cwith|1|2|1|3|cell-rsep|1spc>|<cwith|1|2|1|3|cell-tsep|1spc>|<cwith|1|2|1|3|cell-bsep|1spc>|<cwith|1|2|1|3|cell-lsep|1spc>|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(sort
    '(8 2 5 2 3))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(2 2 3 5 8)>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.29.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    <verbatim|(sort/predicate pred loi)> returns a list of elements sorted by
    the predicate.

    <tabular|<tformat|<cwith|1|4|1|3|cell-hyphen|n>|<cwith|1|4|1|3|cell-block|auto>|<cwith|1|4|1|3|cell-valign|c>|<cwith|1|4|1|3|cell-vcorrect|a>|<cwith|1|4|1|3|cell-rsep|1spc>|<cwith|1|4|1|3|cell-tsep|1spc>|<cwith|1|4|1|3|cell-bsep|1spc>|<cwith|1|4|1|3|cell-lsep|1spc>|<twith|table-tsep|2spc>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(sort/predicate
    \<less\> '(8 2 5 2 3))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(2 2 3 5
    8)>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(sort/predicate
    \<gtr\> '(8 2 5 2 3))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(8 5 3 2
    2)>>>>>>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.30.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Write the following procedures for calculating on a bintree (definition
    1.1.7): <verbatim|leaf> and <verbatim|interior-node>, which build
    bintrees, <verbatim|leaf?>, which tests whether a bintree is a leaf, and
    <verbatim|lson>, <verbatim|rson>, and <verbatim|contents-of>, which
    extract the components of a node. <verbatim|contents-of> should work on
    both leaves and interior nodes.

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.31.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Write a procedure <verbatim|double-tree> that takes a bintree, as
    represented in definition 1.1.7, and produces another bintree like the
    original, but with all the integers in the leaves doubled.

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.32.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Write a procedure <verbatim|mark-leaves-with-red-depth> that takes a
    bintree (definition 1.1.7), and produces a bintree of the same shape as
    the original, except that in the new tree, each leaf contains the integer
    of nodes between it and the root that contain the symbol <verbatim|red>.
    For example, the expression

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (mark-leaves-with-red-depth

          \ (interior-node 'red

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (interior-node 'bar

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (leaf
          1)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (leaf
          1))

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (interior-node 'red

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (leaf
          2)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (interior-node
          'quux

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (leaf
          2)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (leaf
          2)))))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    which is written using the procedures defined in exercise 1.31, should
    return the bintree

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-width|5spc>|<cwith|1|1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (red (bar 1 1)

          \ \ \ \ \ (red 2

          \ \ \ \ \ \ \ \ \ \ (quux 2 2)))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.33.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Write a procedure <verbatim|path> that takes an integer <verbatim|n> and
    a binary search tree <verbatim|bst> (page 10) that contains the integer
    n, and returns a list of <verbatim|lefts> and <verbatim|rights> showing
    how to find the node containing <verbatim|n>. If <verbatim|n> is found at
    the root, it returns the empty list.

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-width|5spc>|<cwith|1|1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (path 17 '(14 (7 () (12 () ()))

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ (26 (20 (17 () ())

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ())

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (31 () ()))))
        </scm-code>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(right left left)>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.34.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Write a procedure <verbatim|number-leaves> that takes a bintree, and
    produces a bintree like the original, except the contents of the leaves
    are numbered starting from 0. For example,

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-width|5spc>|<cwith|1|1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (number-leaves

          \ (interior-node 'foo

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (interior-node 'bar

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (leaf
          26)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (leaf
          12))

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (interior-node 'baz

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (leaf
          11)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (interior-node
          'quux

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (leaf
          117)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (leaf
          14))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    should return

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-width|5spc>|<cwith|1|1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (foo (bar 0 1)

          \ \ \ \ \ (baz 2

          \ \ \ \ \ \ \ \ \ \ (quux 3 4)))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.35.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Write a procedure <verbatim|g> such that <verbatim|number-elements> from
    page 23 could be defined as

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-width|5spc>|<cwith|1|1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          <\scm-code>
            (define number-elements

            \ \ (lambda (lst)

            \ \ \ \ (if (null? lst) '()

            \ \ \ \ \ \ \ \ (g (list 0 (car lst)) (number-elements (cdr
            lst))))))
          </scm-code>
        </scm-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      See source code file in \Psection-1.4/1.36.rkt\Q.
    </solution*>
  </exercise>

  <chapter|Data Abstraction>

  <section|Specifying Data via Interfaces>

  <\exercise>
    Implement the four required operations for bigits. Then use your
    implementation to calculate the factorial of 10. How does the execution
    time vary as this argument changes? How does the execution time vary as
    the base changes? Explain why.

    <\solution*>
      \;

      See source code file in \Psection-2.1/2.1.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Analyze each of these proposed representations critically. To what extent
    do they succeed or fail in satisfying the specification of the data type?

    <\solution*>
      \;

      They can be safely extented to <em|Integer>, may be fail in <em|Real>,
      however, if allow add some other characters, it will succeed in
      <em|Real>, also <em|Complex>.
    </solution*>
  </exercise>

  <\exercise>
    Define a representation of all the integers (negative and nonnegative) as
    diff-trees, where a diff-tree is a list defined by the grammar

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <em|Diff-tree> ::= <verbatim|(one)> \| <verbatim|(diff>
        <em|Diff-tree> <em|Diff-tree><verbatim|)>
      </cell>>>>
    </wide-tabular>

    The list <verbatim|(one)> represents 1. If <math|t<rsub|1>> represents
    <math|n<rsub|1>> and <math|t<rsub|2>> represents <math|n<rsub|2>>, then
    <verbatim|(diff> <math|t<rsub|1>> <math|t<rsub|2>><verbatim|)> is a
    representation of <math|n<rsub|1>-n<rsub|2>>.

    So both <verbatim|(one)> and <verbatim|(diff (one) (diff (one) (one)))>
    are representations of 1; <verbatim|(diff (diff (one) (one)) (one))> is a
    representation of -1.

    <\enumerate-numeric>
      <item>Show that every number has infinitely many representations in
      this system.

      <item>Turn this representation of the integers into an implementation
      by writing <verbatim|zero>, <verbatim|is-zero?>, <verbatim|successor>,
      and <verbatim|predecessor>, as specified on page 32, except that now
      the negative integers are also represented. Your procedures should take
      as input any of the multiple legal representations of an integer in
      this scheme. For example, if your <verbatim|successor> procedure is
      given any of the infinitely many legal representations of 1, it should
      produce one of the legal representations of 2. It is permissible for
      different legal representations of 1 to yield different legal
      representations of 2.

      <item>Write a procedure <verbatim|diff-tree-plus> that does addition in
      this representation. Your procedure should be optimized for the
      diff-tree representation, and should do its work in a constant amount
      of time (independent of the size of its inputs). In particular, it
      should not be recursive.
    </enumerate-numeric>

    <\solution*>
      \;

      <\enumerate-numeric>
        <item>0, 1 have infinitely many representations, so other integers
        have infinitely representations.

        <item>See source code file in \Psection-2.1/2.3.rkt\Q.

        <item>See source code file in \Psection-2.1/2.3.rkt\Q.
      </enumerate-numeric>
    </solution*>
  </exercise>

  <section|Representation Strategies for Data Types>

  <\exercise>
    Consider the data type of <em|stacks> of values, with an interface
    consisting of the procedures <verbatim|empty-stack>, <verbatim|push>,
    <verbatim|pop>, <verbatim|top>, and <verbatim|empty-stack?>. Write a
    specification for these operations in the style of the example above.
    Which operations are constructors and which are observers?

    <\solution*>
      \;

      <tabular|<tformat|<cwith|1|-1|1|1|cell-lsep|1spc>|<cwith|1|-1|3|3|cell-rsep|6spc>|<cwith|1|-1|1|-1|cell-tsep|2spc>|<cwith|1|-1|1|-1|cell-bsep|1sep>|<cwith|1|-1|1|1|cell-rsep|2spc>|<cwith|1|-1|1|1|cell-tsep|2spc>|<table|<row|<cell|<verbatim|(empty-stack)>>|<cell|=>|<cell|<math|<around*|\<lceil\>|\<emptyset\>|\<rceil\>>>>|<cell|<em|constructor>>>|<row|<cell|<verbatim|(push
      val ><math|<around*|\<lceil\>|S|\<rceil\>>><verbatim|)>
      >|<cell|=>|<cell|push <verbatim|val> into
      <math|<around*|\<lceil\>|S|\<rceil\>>>>|<cell|<em|constructor>>>|<row|<cell|<verbatim|(pop
      ><math|<around*|\<lceil\>|S|\<rceil\>>><verbatim|)>>|<cell|=>|<cell|pop
      top value from <math|<around*|\<lceil\>|S|\<rceil\>>>>|<cell|<em|constructor>
      and <em|observer>>>|<row|<cell|<verbatim|(top
      ><math|<around*|\<lceil\>|S|\<rceil\>>><verbatim|)>>|<cell|=>|<cell|get
      top value from <math|<around*|\<lceil\>|S|\<rceil\>>>>|<cell|<em|observer>>>|<row|<cell|<verbatim|(empty-stack?
      ><math|<around*|\<lceil\>|S|\<rceil\>>><verbatim|)>>|<cell|=>|<cell|<math|<around*|\<lceil\>|S|\<rceil\>>
      =? <around*|\<lceil\>|\<emptyset\>|\<rceil\>>>>|<cell|<em|observer>>>>>>
    </solution*>
  </exercise>

  <\exercise>
    We can use any data structure for representing environments, if we can
    distinguish empty environments from non-empty ones, and in which one can
    extract the pieces of a non-empty environment. Implement environments
    using a representation in which the empty environment is represented as
    the empty list, and in which extend-env builds an environment that looks
    like

    <image|<tuple|<#89504E470D0A1A0A0000000D49484452000000F1000000A00806000000DD198A5B000000097048597300000B1200000B1201D2DD7EFC00000B9049444154789CED9D316FE3C819865F075B1C9000596DB5E544EC7306E41FB085DCA5B8466EB3692C20D5767613E0AA60DDB94900AB72BAC00E902D0358409CEE0A1BB7D75D43657EC16A0FD8229D83B1DFD99D2329D99665931FF93E804059243F8E66F8CC7C4399D2C6D5D515841076F985DA4E08DB4862218C238985308E2416C238925808E34862218CF3AC8B0D9839B709E07969C5D3F212C0273EEAC4E7DEFB9ACB201E402725067008E0BCF4EAD3F21AC08F00BEABB10C2E480CE0DBD21A6186AE4A8CDCFB5A4FDCCCB95700FE957B7F585AF9B46578555A214CA139B110C691C4421847120B611C492C847124B110C691C4421847120B611C492C847124B110C691C442AC40E6DC45E6DC55E6DC5EDDF5278985588D1DEE35ADBBFE24B110ABD1E35EB3BAEBAFB33740081BF0B6D170BBE4C74505CE9C3B02B09BBE947B3FCB9C3B0130E26B1300032EC3F6D3DCFBEDCCB92180330097B9F75B99733DAE8FFB9DE6DEEFF03869BC29F799970A74B36D659CCCB970AC70CC31CB1CCA740A603FDC97839B9B733618237E15ED8B45C781466261806B8933E78E29F4CFC89C1B51868C8FC09C620759B68304DC26883BA1C8D72369EEFDB58C140914BACF7D0EA28415F106B7A4D29571282F589E31D70D43A713D7B10300D74D97090C8DC4AB9339F73AF7FEB8EE32F0BEE455095F8CF09CB72436995F02F87D7864CEFD07C037C9C81CD3D92105DDC89CEB47492869A82B50D6B8CF90AFF729DB24736E97CF332EC336D33BC42BB64B651CAE1E7079907B7FC94E6896940BEC60E6147F5C3A400149BC3A419E5A256627B27219E2FDC475DF5BBD8CCC5DDBF25F003FF1BD1EA6A9354508A9E851E6DC20F77E9CA6B0B88911C58922CD2957205C5DDE0FA31D53EB20D007AE9B30CDDDAD88D7A3E0E9F6812D4A5B15073CEE2CF7FE34F93B962B4ADC6759A6B1D3588624164D2774347F00F06ED1BC38F7FE20732E9CEC175C5E8F64491ABA5B98BF5ECBC251308A8F383F8D73E008459D2D89B751D8BE324E728C74048FF363701E1FB7192557C097228945A3593665A12C674C5BD3796378DEA37CBB1425BD8A1C9FBFE51C377219D35DA6D0279C97CE393AA6F12A53E9657138FA0E19331DD18B65DBE5F677BAF2AD0B5BC23A316DCD39FA9D32ED9D27E96C906AC8B92A12E1270551A25CE1AAF0C582787DC61B25F18A54C649A48D1DC090CB9364FF3947F94929EA023AF9836A9973E7B9F70FBA98F3D018617FA688B57FC75693E7C4E27634120B611C492C847124B110C691C4421847120B611C492C847124B110C691C4421847120B611C492C847124B110C6E9EAFF4E1FF21B231EC2D7007E78C0FE2F017CE2A34E8E97DD29249A4F27255E07EBB889428875A0745A08E34862218C238985308E2416C238925808E34862218C238985308E2416C238925808E34862218C238985308E2416C238925808E34862218C238985308E2416C238925808E34862218C238985308E2416C238925808E34862218C238985308E2416C238925808E34862218C238985308E2416C238CFD480F72373EE1B00EF71F33CFCA0DAC7DCFBF786DE82681992F8FE3800FF04F03F00FF06D0B3F60644BB503A7D7FC26FF9FE04E02B007FCBBDFF68ED0D88762189EF09A57DC7BD0ECD145CB41649BC1ADF02F8417361D10436AEAEAE3AD71099736104DD2CADB81F5F715EBC2A2F017CE2A34E8E73EF8F6B2E8378005DBDB0B5997BFFAAF4EA139239771ED2F2DCFBDA52725E5DAFB51EC4C3513A2D847124B110C691C4421847120B611C492C847124B110C691C4421847120B611C492C847124B110C691C4421847120B611C492C847124F10A64CE3DCF9C7BE8AD8CEB28C766284B6985E81492F89E509A737ED756DD848EE45C22771B497C0F12810F73EFDFAD2DF08AF066FE4389DC6D24F11D2908DC986FC290C84212DF81A60A1C91C8DD4612DF42D3058E48E4EE2289976045E08844EE26927801D6048E48E4EE21892BB02A704422770B495CC0BAC01189DC1D2471425B048E48E46E208949DB048E48E4F623895B2C704422B79BCE4BDC76812312B9BD745AE2AE081C91C8EDA4B312774DE0482A32805F953610E6E8AAC4CFBA28702411F9903FD12A0CD3398939027FDD5581237CEFFF00F05AA9B56D3AF523E3490A1D469FBF9736785A5E03F811C0773596217CB1C1732E5FE5DE7F2C6D211A4F67244EE7C000DEF3E4AD9397003EF151279E3F34FE4622DBA4131277F522D67DC89C7B2D916DD2FA39B104BE1BFAF8C92EAD965802DF0F896C93D64A2C81574322DBA395124BE08721916DD13A8925F07A90C8766895C41278BD48641BB4466209FC3848E4E6D30A8925F0E322919B8D798925F0D320919B8B698925F0D322919B89598925703D48E4E6615262095C2F12B95998935802370389DC1C4C492C819B85446E06662496C0CD4422D78F09892570B391C8F5D2788925B00D24727D345A62096C0B895C0F8D933873CE41029BA54AE4D8A6E27168E248FC2E73EEB712D82E05917FC7E7E29168D417E565CE6D02F81EC007007FCABDFF6B69236186CCB93F02F833805F03F84DEEBD57EBAD9FA68DC46FB87C111A3F73EE55690B61027E7BE65F2830F83DDBE21168CC48CCF953E8A9C3D7A58674EC583DB76D38177E43813FE6DE6B6EFC083449E2D0C09BB9F7EF4A2B857938329FAB635E3F9DFA191721DA48E77F645C08EB3C6B6AF933E72E000C00ECE7DE1F943610A6C99CEBF15388C056EEFDE59ACE9B70CE5CF0CF17B9F7F3D2462DA3C923F10E97D3D21A611ECA3506305F97C0B8891B62ED0398754160345CE21E97B3D21AD1167A8FD4BE21EEDA3A86A673A7743A73EE08C06EFA52EEFD2C73EE04C088AF4D98FE8665D87E9A7BBF9D39370470162A35F77E8B69D451B2DF69EEFD0E8F93C69B729F526F9A94E73AD5CE9CDB03F016C041EEFD7EF2F7757C966B8BFB5C6FC7D742D926B9F7E3D29BEE104C4143DDF7635B863A61DB1DF1F520C59CED3BBCA5FEC3BABD24DE75BA9C39D7E771068C35ABCAB4B85D8E9B917583AFC52BB02F28691A67CA91779FDB0CD9EE9DE0D69138736EC406CBF808CC2952A8AC6D56EC2EC59DB0A17B6C84294F8058A9676CDC179469948899C61B543530638E7902C4D17AC2E59427D05B9E601B3C5648D9E69C5BCF58D6531E5F23FD974E77837539A748679463836D31E476CBEA7FC478076C47703F301E781EEDB08D4B23661820986AC7B933186FCA4E3D8D33E63974996CBFF0DC6923771989E3493EA4A01B6CE020C2989286CA43D220B3D870DC363C2614ACCFCAEFC793E20EF1AA484FA2111B38C4CA3992C48B61F34203F739624C2A627695509783503F312B61A71A04DE4EEB31C98C96D57FE840437BC76CE8326D7B667171DF45B2C5F3AEC76387638C2BE2F40B7186EB9E67379D5B47E2E442C1111B16692A8C2FE9585A91F32495DA63A3CE59C1F1AAE405E5DA5910AF17E3852BD5219DE2638FDBCE0AC71873BF7EE1C4487BFBB8BDAE76FF9C9886E6495B8E0A296971745B56FF6F99FE0E938E79C84EE0F3A0103B85307A27EDFB21891FE853DCE982388342E7D2A95118779D1373DE132AE682CB5E4C51B9C96E452F1D53F14132E71CA473E0087BE5D9A278612E5D2A14477B4A7DCA5E7994AC031BBF57D14B97E6D95D86426CF19A44E8ACB79311306653A3E4138345F51FAF9B547D64D42F6456714A138E1F961B85736EC66C6C503876BF3005DA2D74369D9A0FE33689D9B39E31FD4D4FFCF0BC47F976597169C5C6E76F39C78D5CB251905CE43888237721DE6DE9D09C27DA28913C9631C6BA1EB5BBDC4BDF06C5BDE4F423769A730AD44BDA0955E740A1FE639B0D9842EF25EBE749DB9F55C4AB225EBF384846DECF595E314E321FEED454E92E1F31C5F437678F7BCA9E6E9E7C587FC95E39F6C4B1712649E523A6B14CB52E16C48B3DF6288957453C893E5F594E2EA29D50E009BECCEF70C7CEA18BA4E96F4CAD0F588727C9F4E328A99BAAFABF8C9F4E24F1E2083AE1BCFB8AEDDDE371FB4BEA3BCEC35329639C0F2C571A27C63A4AE6DCAD47FF3B2D8471F4BFD3421847120B611C492C847124B110C691C4421847120B611C492C847124B110C691C4421847120B611C492C846500FC1F1A1F87A7A0D3BEC20000000049454E44AE426082>|EssProgLan-ex2.5.png>|241px|160px|100sep|>

    This is called an a-list or association-list representation.

    <\solution*>
      \;

      See source code file in \Psection-2.2/2.5.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Invent at least three different representations of the environment
    interface and implement them.

    <\solution*>
      \;

      See source code file in \Psection-2.2/2.6.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Rewrite <verbatim|apply-env> in figure 2.1 to give a more informative
    error message.

    <\solution*>
      \;

      See source code file in \Psection-2.2/2.7.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add to the environment interface an observer called <verbatim|empty-env?>
    and implement it using the a-list representation.

    <\solution*>
      \;

      See source code file in \Psection-2.2/2.5.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add to the environment interface an observer called
    <verbatim|has-binding?> that takes an environment env and a variable s
    and tests to see if s has an associated value in env. Implement it using
    the a-list representation.

    <\solution*>
      \;

      See source code file in \Psection-2.2/2.9.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add to the environment interface a constructor <verbatim|extend-env*>,
    and implement it using the a-list representation. This constructor takes
    a list of variables, a list of values of the same length, and an
    environment, and is specified by

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
        <verbatim|(extend-env* (><math|v a r<rsub|1>><verbatim| <text-dots>
        ><math|v a r<rsub|k>><verbatim|<verbatim|)> (><math|v a
        l<rsub|1>><verbatim| <text-dots> ><math|v a l<rsub|k>><verbatim|)
        ><math|<around*|\<lceil\>|f|\<rceil\>>=<around*|\<lceil\>|g|\<rceil\>>>,
      </cell>>|<row|<\cell>
        where <math|g<around*|(|v a r|)>=<mid|{><tabular|<tformat|<cwith|1|-1|1|1|cell-lsep|4spc>|<cwith|1|-1|2|2|cell-lsep|4spc>|<table|<row|<cell|v
        a l<rsub|1>>|<cell|if v a r=v a r<rsub|i> for some i such tha
        1\<leqslant\>i\<leqslant\>k>>|<row|<cell|f<around*|(|v a
        r|)>>|<cell|otherwise>>>>>>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      See source code file in \Psection-2.2/2.5.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    A naive implementation of <verbatim|extend-env*> from the preceding
    exercise requires time proportional to k to run. It is possible to
    represent environments so that <verbatim|extend-env*> requires only
    constant time: represent the empty environment by the empty list, and
    represent a non-empty environment by the data structure. Such an
    environment might look like

    <image|<tuple|<#89504E470D0A1A0A0000000D4948445200000235000000C00806000000FCD5921B000000097048597300000B1200000B1201D2DD7EFC00001ADC49444154789CEDDD6D6C5CD95DC7F1BFDB5595B22B11075416B6A5A7732B44DFECA6B2294595C0DA3AA848408368A2BE4034BCB1112FE2B848B55F2008152FEC1774B3CB2B5B4053247811239A16218162C21476251E6235AA2A8144C73D555BA9C012A7D9DD6617556B749CFF498EEFBD339EF1DCB90FE77E3F921567EEC3DC8773CFFDDD73CE8CA7F6F7F7050000A0E9DEC2190400003120D400008028106A0000401408350000200A841A00001005420D00008802A1060000448150030000A240A8415F89312B8931FB89316BFDE6194662CC355DCFB970F67EAF0300701C841AF4D5B3765D4476F4671CABBAEC766A1D8B7D5E07006064841A1CA55340E8981691DD9EB57BA9D7DDBA77725E070060648F71C8D04F62CC8C0B2322B29618B3E0C24DCFDA33F260DA8688B8D7F6B42567B367ED96CEB7A64166AF67ED291199F7AD3DAEBB49DFCEADC7AD7F2731E696FEBEEA5A871263DCB2D7743967B167ED6662CC1DFDFFBABE870B44B3BA5E37EF860625B7CDB384250068175A6A30C8BC6F4D1191F3EEFF89311D37D64644DC389859ED4272F36D07C1C2858E531A2E24082F6BDAEAE3C2CBB6BE3EAFEB58D790241A68A6751DAB1A6024E8C612DD1EB7BC0F5F6BFADAA26E3300A065083518C485832DD74AA22D329E0B35EB3D6BFD581BDF85E45B73DCB43DDF8AA2C1654DA79FD7B13AA2A1C4AFE760FD1A50E635F8F4EBAEF2CBEF04DBE396BBA5BF2FE62C0B00881CA10683CC04E369668260331D048AF9D43C87C6DFB8969DA0D5C5CF2FDAC574109A8265777CEB8BB6E484AFE7BD57B8AC0B41533D6B130D6100809621D42097868EB07B6745BB88BC691D3F732EE866120D306E991BDA1D35130C12F65D4E128C9791603DEBC16B1D5DDEBDBE196CCF76B07CD81AD3D1E5D6C6FD083A00A0990835E8675EC3CA35EDD6D9D26EA55D6D39B9E6038B8EA3110D252B3A18783B1837E35B5AB674FA46B0EC1D5D7E51BBA1B674FE9E88DCD016982D1F5ADC3C41C0590BDE7741DFB7D3B376B5CF3E01002236B5BFBFCFF90500008D474B0D4A777169F9E4C5A5E5B31C790040910835A8CA15176E38FA0080A2106A50BA179E7FEEAE885C16914B1C7D004051185383CA5C5C5AB622725A430E000063A1A50655BA2A228CAD0100148250832A5DA10B0A005014420D2AA3DD4EF6E2D2F269CE0200605C841A54EDBA885CE02C0000C645A841D55CA899E32C0000C645A841A5B40BEA2EDF5903001817A10675D0751FEDE64C0000C641A8411D58420D00605C841AD4810B35743F0100C642A80100005120D4A00E8C1B2CCC9900008C8350833A98D3C1C200001C1BA10695BAB8B46CF48F5ADEE64C0000C641A841D5AEF2F79F00004520D4A0321797965DB7D3DD179E7F8EAE2700C0D81EE310A24257F913090080A2D052834A5C5C5A767FC4B2FBC2F3CF59CE0000A008B4D4A02A9769A501001489961A944EC7D2D04A03002854A35B6A1263E6745C46D537C70F89C84B9957CB75BA676D53FED4C0256DA969A4C4983A0C6C767F2BEB6511F956664A795C79BBDEB3B6B1E7B22928730F51E630500CDD4F57AB2EE089317B3D6B2BED4AA949A57724FD5E1AD3F4EFA5A9C9F97695FB95CCC4F2B6618E2EC4F250E62873381ADD4F28DB5911A9AC520400C48B81C228DB256DC60600A050B4D4A0341797965D98B9FDC2F3CFF1C72B01008523D4A04CAE2FFC3A471C003009743F61A22E2E2D1F7C224B5B672E30C80F003029B4D460D25C97D3BF5C5C5A7EB7FE9D27BA9E00001341A841197E4244FE53449EB8B8B4FCE2C5A5E5BFE0A803008A46F713CA7057BF346B46DFEB7738EA0080A2D15283B27DF685E79F6BC4170502009A85961A94E9BB22F2498E38000C2731A62322D7B4A57BA767ED2C87AE3F5A6A5086B789C89BEEDB8419280CA0AD12636E25C69C1B71F7374464B767ED54D181263166C56D536642CD24C6ACB99F61B68A961A94E107F4AF72D3ED04A095126366B4B56577D8FD4F8C991711F73391D6999EB5EB22B29E9950238931D322E282E0E6305B45A841195E13915FE1480368B2C4986B7A837541604544B67BD69E095E775645642BE832F2AFF99606D75AE35A5E127F2834F06CE8FC7B2272A667ED8E88DC089659EC59BB192C937E4F674DB7CDBDEEBAADCEEBEFE734184DEB3AB7F4F7799DA7A3CB6EEA6B1DD732A4AD232BBAEECD9EB58BAE75A7CFFBECE9BA37F5B579DD2EF7FB823F56F228AC6DE8B45DDDB69EBECFBAAEDF77B5DDF2DBA7DB93F4ACED1B0CE97E42197EADA9DD4E89312713636C62CCE5C41893990128BECCB9B2763D31E66C66224A911873557FD25F16EAC3C38CDEC877355C1C740FE90DDAB72C88BEB6ADAFAFEA8D7A2A15687CD0D8D1F9778220112E930E3487DE535B5D76354C9CD1F5B830B0A88BB979B6F5F5CDE0F5EDD4B27EBF56348CCCEAFA165CF8EAF73EBAEE4D5D663D0827BB41B8F1016E4DDF67D1BF1E1C5BD16933C1EFCE293D0E7D038DD052737080DD8DEA6ECFDA4A6FBAAE22CBBC381A53C03A26E66FBEF0F926FF114B57367ECFFD24C67C4E3F9E7E6C2E287DF0FD4FFFF89F7FFE8B5FA972A712633E2E221FC94C18DE93EE87B057B82744E4A3EE2731E61BFA57EDC7AAAB5D9973E5B667ADCD4C2C59628CFB66F1E3961953525DF7BADE703FA1E7E072CFDAAB414BCAF99EB57BAEC5455B124443C096DECC7DCBC24AD03A714D034EDA82FEDFDFD4F782E9331A1A1ED250702EFD9E1A8E3ADACAE3428968F071DBE9D6D9D116923D1740746CCF8E4E0F9775EF9724C6DC71EB75FFD7F7147914C232EF136CEF6AB0FE83C0A4DBE9F76345E7BBA5CB2DEA3674747BD6FDB6E9FCF37E3B33472E47EB438D7E757F577FAA34EEFB9FADC13EC4EA8322F28C88BCA2FBF7FA98FB79FAE597EF5CD0B257A57F1691EF8CB31FFA73353305E37061F15775F9BBFAF3FD31D7795AFF44491D1E7C6E8BC871C3957F389A745DF7DEA02523DCD619BD51EF05FFF72D32211704CE68B0F16357E68375863AA99BF67C30CEA5A3A12594FB9E1A047C6099D6D613BFAC6F415A09B6612608590FC38E3CFAC4D5742A58EC052D3499F7D1DF6752EBDF0A7EDF097E5FD563129A4FCD1FFE9E170673116A6AA267ED58176962CCDD71D7812C7DC2FD49115976376FD7A2971813C571D6A7F6633FB9EB13DA49CA5DB112635CCBCCE7B4BC1D1C5B6DDD8842CFDADBC7DD8FB2CA9C1E6F770EAEA4B637F7061B84800DBDA9AFE9581B77239FD11BFE74D05DB5AE2D229EEF9AF1DD4E792161D07B9EC90B29C1ECBBDA22B41974DF84C1A193B75FDABAD30996DDD3569BBCF7F161672767DBE753037DFDFEFA7146EB03E6EF68483C38363961E810420D3080764BD2BD82D2F4ACBDC4D1AE56CFDA7E217226F569A12DBDE1F77C578A1F809B18B3DFA7AB6A3515683683F97775FEDDE0A3DFE9312499F70CBB6F82EDEC68F7971F03D349058299203C1CEAE6D2F7DFD4C074F09E3D6B7DF758EEFBE4B5EC045D57D33A8E66568FDF4662CC82AEF7BCEFDE4A05223F7079477F7F38D07810420D000043E8597B2A9C4BBB8CF23E6E9DEE8E92707070EAF583312C9909D96EA981EFE9C241F0FB6A38F0360824E1FCA7F2960D5E5BCC6B251AF43EC1EB5BBE1548F76F2A98B699FE7876388FEE5F387FEE76F4C3A79F0000A8116DAD58C8194F8323106A0000A809ED76BAA35D57437DE11C1EA1FB0900809AD0AE9B4CF71586434B0D00008802A1060000448150030000A240A80100005120D400008028106A0000401408350000200A841A00001005420D000088C2D4FEFE7E63F7233166CEFD797E11B19989C3737F81F9AEFE1CD78744E4A512773DCFE99EB527735E47C11263BA63AEF1E4933FFC434F7EE7E5FFFD8FCC9411CEB788BC2C22DFCA4C298F2B6FD77BD65EAE701B5AA18832A73FE3D4959439D45EA3434D111263DCC5D1ED593B6EA5010CC585F1F7BEEB9D17FEEE9F5EBCC0114319F401708E3080D8D1FD040000A240A80100005120D400008028106A0000401408350000200A841A00001005420D00008802A1060000448150030000A240A80100005120D400008028106A0000401408350000200A841A00001005420D00008802A1060000448150030000A240A80100005120D400008028106A0000401408350000200A841A00001005420D00008802A1060000448150030000A240A80100005120D400008028106A000040145A1B6A12634EBA9FE0FF263313507CB933C1EF87CA2030099439B4C9632D3EDBEEC2BE2D225644CEEAEF17327301C5BA2C22A7BFFDDFFFF38496BDD3227297638C09BA22223ED85C0A7E07A2D3DA969A9EB5EE86D2159167F4E74A6626A078AE9C3D73FF8D371257FEB41C02937435A8E7AEF7AC2544235A6D1F53E383CC4B3D6B6F67A60205D372F6D554F90326A667ED7511F9A6AEFF32471A316B75A8E959EB5A6ABE21227F9C99084CCE1FBA72A7E50F28C36744E44BB40C227653FBFBFB8DDD451D0037EE3818A3631BC6715AC7E454AA672D4F6125488CB950C0B88471CB9DD1B138557725740967935740993B21224F52E610BBA60F1436FA733533A55CBF5D83AE842B342D97E6420D8EB53BDF2FEAB8B0AAB8303F57F136B40565EE01CA1C068AE1D34FB6EAD49E18F3FD1A6C0383FF4A5493F3FDB52AB72379F049E1B9CC044C04658E3287A3B57DA03000008804A1060000448150030000A240A80100005120D400008028106A0000401408350000200A841A00001005420D00008802A1060000448150030000A240A80100005120D400008028B43AD424C69C4E8CB19909D56CC7EDC49893998988CECFFEF4076E7E6876E6D355EFD74F3DFDF48B1F9DFFF0EF6626202AAE5ED1FAA5F2BF6E9D18733D31E64266025090D6861A172444E4BA889CCD4C2C59CFDADB22724544BA049BB8B94073FFFEEBAFBE746BA7F23071E7DEBD5FFCFAB7BFFD1B049B78697DD275F54BCFDA6E0D76D4059A4B041B4C4A2B434D1868345054AE67ED55824DDC7CA0F9B7AF7CE597EBB0A33D6BEFBE76FFF5F7136CE2940A3457EBB093AECC89C81CC10693D2BA5053C740E3116CE255B740E3116CE254C740E3116C3049AD0A35750E341EC1263E750D341EC1262E750E341EC10693D29A50D38440E3116CE251F740E3116CE2D08440E3116C3009AD08354D0A341EC1A6F99A12683C824DB33529D078041B142DFA50D3C440E3116C9AAB6981C623D8345313038D47B04191A20E354D0E341EC1A6799A1A683C824DB33439D078041B1425DA501343A0F10836CDD1F440E3116C9A218640E3116C508428434D4C81C623D8D45F2C81C623D8D45B4C81C623D8605CD1859A18038D47B0A9AFD8028D47B0A9A718038D47B0C138A20A3531071A8F60533FB1061A8F60532F31071A8F6083E38A26D4B421D078049BFA883DD078049B7A6843A0F10836388EC762386A6D0A349EABD0126344834DE57F7DB78DDA12683C7793498C71C1E6CB1F9DFFB07BF51F33336162DA14683C2D73735ACFB9576D66262010434BCD936D0B345ED862134B406D8AB6051A2F6CB1E93CF563BF9E990193F258DB028D17B6D888C84732330081A6879AF78AC8C7DB1868BC20D83C43575439DE716AFA9936061ACF079BFFBA73E717DEF923EFF8B9CC0C28945ED7CFB431D07841B0F998889CCECC00A8A9FDFDFD461E0BED72FA5B11F95711F94C668672FDB588FC52C5DBF0672272C75DF85A0160025C0BCDBD575E7DFA95EF7DEF63151F5F17645F1491BFCC4C29CFCF3C7EE2C4A7DEF3CEA79EFBC2F6DF7FBAC2ED8856D0E57442447EB3E2FDAC459913912511596D6BC0C3608D0C35C1189ADF12910F6466289FDB9E3AB414596DA225D84C80EF72BA73EFDE5F8988A97873DCFBDFD59F2ADD7AFCED27FEE83D4F3DF559824DB1C23134BA62CADC03B744E40FDADC7285FE1A176ADA38287814FA2901824DC1DA3A866618EEE6FBF8DB4F7C9960539C360E0A1E05C707FD346A4C0D81E6687CDCBB78049AC1F8B877B1B8611F8D8F7BA39FC6841A02CDF00836C521D00C8760530C02CDF00836C8D3885043A0191DC1667C049AD1106CC643A0191DC10669B50F35049AE323D81C1F81E6780836C743A0393E820D42B50E35049AF1116C4647A0190FC16634049AF1116CE0D536D410688A43B0191E81A618049BE110688A43B081D435D410688A47B0391A81A658049BC10834C523D8A076A186403339049BFE08349341B0C947A0991C824DBBD52AD41068268F609345A0992C82CD61049AC923D8B4576D420D81A63C049B470834E520D83C40A0290FC1A69D6A116A0834E523D81068CAD6F66043A0291FC1A67D2A0F35049AEAB439D81068AAD1D66043A0A90EC1A65D2A0D35049AEAB531D81068AAD5B66043A0A91EC1A63D2A0B35049AFA6853B021D0D4435B820D81A63E0836ED5049A821D0D44F1B820D81A65E620F36049AFA21D8C4AFF45043A0A9AF98830D81A69E620D36049AFA22D8C4ADD45043A0A9BF18830D81A6DE620B36049AFA23D8C4ABB45043A0698E98820D81A619620936049AE620D8C4A9945043A0699E18820D81A6599A1E6C0834CD43B089CFD4FEFEFE44764A83CC590D33049A86D20BFD925EF82EE45CD28AA0961263AEF7AC3D4BA0692E170E1E7FFB892FBFE7A9A73EFBD5AFF5BEA875C7E5BAEE902B7322728140D35C6120151157BF9DE43C36D324438D2B103F2F22FF47A069360D369F1291F789C872CFDA2B75DCA1C41823225FFFC1271EFFF7B7BEE5AD5F23D034970F366FBEB97FF7FE1B6F4CF7AC3575DC99C41817F6FF4144AC88FC3E37C2E60A82CD9B2272AAAE650E834DA4FB490BC72744E44745E46DDA628306D273E92A6E7F817FB2C67BE15A94E4BBAFBEF6BE3BF7EEBDA9AD8568A6B9D7EEBFFEEAFD37DE70E7F0DD893175AD437C9785BB3EE628738DE6CAD8291179BF96B9B9B61F90269AD4981A7FA1BF2222D74484A79786D2AEA6AB7A1E9D77D5F862F7E5EE4BAECB93D6C146734FCC7F2222DFD49DA8DD7887E0E1CDF90265AEF15C37E29FD6B9CCE16813E97E4A8C71DD13B7698A8D8B56E207177ADDBAA034689DD5310D3633031A4BCFED85BA8DE7D2D6A339CA5C7CF4DC5E70E3F3DA7E2C9A6662636A000000CA3472F7D3DCDCB31B7373CFAE642654686EEED985B9B9676F34B1E43479DB8755E43E4EBAFCB5E17C8CABA67540676EEED99EFB3733F1F8EB9CD1754E672616F71E6EFDF39909C8A8E3B539897287F18CD452A315D9391139D3EDDEDCCBCC30FC7ADC9B2E76BB373733138FBFCE5B22B2DDEDDE5CCD4CAC2957698AC80D3D9E3BBA1FAE825BD0E37CE81805C7DF2D9774BB377787382EB9CB6845EDC6C9F80A75B3DBBDB9985941767D6BBA3EE9766F26A9F7590B664D6FFBD8E7A7A8F237C4FB34AE2C9525EF1CE88D26BC311F94252DCBE99BD0C0729B538E0E74BB37A7B4DE485BED766FAECBA3B239DFEDDE9CCDCC3522BD3E5C39582FB29ECAD95F772C37446476D07169BB3E75E582961577AEDCB13BEFA61DB76ED3756E68FD2BA9B2D5D1F3E4D7E9B6635B0A2E7718DFD02D357A52D7F46635B11BCA18CE8BC84AC39E7AAE69A5B9937A6D472FD287F4A27617DB56662D7D1CB1CCBC56066EB4BFBB181774FEBEF486339FB73E77F1BB1B8FFB719541CE8D69ACF35372F96B62599AB823CEC1AA3FFFE91B48F0FAD45137EEB01C0565693BBD1E2DB77B7AADF865DDBCD305B522B9FDDC9964A09107DBBCA5D7D3466622427975E5822F775A0EFC791FB96E9307E5FB5AF0F03715049A690D547B4119DC0ECE6191E50E637A6C84C517F4E9352C5407CDA722E29BDE1EA6E5CCD259E734154B988807C9798A7BF8D4E7FE9D9B7B764B9F22B707ACA616F409CD5D2C872ACD6EF7E62979F41412BEEE8E6912DC588E346899A03275DCD3CDAE9EC7BEE74ECFD17A7ADB724CA7D753C0F9C9943F3D86D7FC5353D08A349B73D39560B9B0CC8AAEF74C81DB1AABCC399824BD99AC68C8CC2B0F3BE1CD456DEAB423EB937EF47DDD3ACE84B368F95AD07A674F5BF476BBDD9B79DBE797B9A1DBB92A414B57EAA9DE6DF32D779DD25A9335A0AE0C8FE1B66F61394EDDA675A47B9F533975C7390D347DCF7311E50EC518654CCD4C5E05EFBA2082A7A7ED202D1FC515D2442BACB5A3FA2483A6C633039EFA7652CDE075D6D11B44DF9B6F59B445A293777E47E12A70ED2258C96BCD19F3FC64CA9F565EAE12D9D027B1150DD5038FA92FB3FA24E7CA505ED37493CA525932E720E0AEE1FDBC3122FAFABE3E098F62416F26DBA9F54D0F28636EDECE98631C66F2DE5783C9AEEEEB8AD661796527B415746788FE9EBE39EF68AB13E52DDF307565EE03C80875DB8C9E831B5A56EF040F6F1D7934FEC94DBB95D3F25344B943014609351D3DE987B8A7175F69E9053BECA03AD7CFB9AB3726493D39E77185682BE7C92CB437C47AEA22F778962DE82B5E3DA2D238926BEDD0B0B0A841237D2EC6393FB9C74B6F347B3AFE6175C456840D5F0E33539A5596CAD2EF1C9C493DD85CD3D7B783D7DD53F5FCB04DF44170C97BF2F56127AF6BC86FDF38E72E773FD579BD81AE0D13A07DF07237577F231CB0DD131B90DC7083CE876FFDEAA4CBCA8875DBB4FE6C69795D0F5AB7A775FD8B3A6D2FE7E1BD887287028C126A32175DF0743C1BF47F4FD23037DDBC1B541D557ED3D48BFE86DED8F36E1EC7A295F66E9F27CFE39E9F4CF91B71FA21FEE67AC47ED31570D830C7782B6F1E0D9BA304CEDCE07244D8098D73EE86B93687BA7EF566BAA5D7C2B923B6BB8E6315EBA0EFB1D6EB7821FDE18163D46D7BDA95E8E7DDD271323E50850FD45BFA909D873AA362A3849AED9C9B943FE1BBC1A0D49168A1DC1BA2C2DBD17138FD0A931CD13C5E376E7F6626F971D141261568E45157E174CEB918E7FCE4953F3FCE614F5B02861ADC1BF49F0FEA3A6852592A4BEE394859C93B6E7A5EE64708362BE96E1AE5EB98BCAE27D1F7D8EDD3FA362CFFA996BC7DBDA6C164555B2387B97E7D17D4B9BC561A2D8F6377FF462CB7AE4C059ADDE0F5E3D46DBEFBE89CFE7F212847FEDED309A6A5CF5511E50E0518FA23DD7A427BE147D9E4F0C7391F069370D0659ED4474077B559EFC80B5A6F6061B35FF811E5DCEDAB331DB07AE8C2CB19C42A3A607157F7EF106D21CB151C93CC32A98F2E7ADB83CE9D8695F4A7340E9649AD6F479B7CC37232D6F9C95B3ED89E59FD28676E2597B3AEF44790A5E965A90CFD8E4BAACC6EF94F47A5CACBEEB01F8F0EC6CF25E96E83BC6B6694E9C3D2F2DC09AF077D6DDE0F44F7DF9932E89A0996BDA5038633413AEFBD90394687CE6BBFBA4DEBCA73A3D66D92ADDF76B41CFB8F8F87F5DB76BAEBB1A87287F18DFA3D35437DBAA40A0DFD9E1AFFE99DD9B23E51529582BEA7A694F2C7F7D4F457F33AA0C8EFA9E904DF53336E40F2DFB192F92E1ABEA7663875AE2BF99E9A7A19E91B85B592DFCE49C195D284BDD7B49B900E925E1CF623DA4D55D4F929A3FC35B52C95A5C67580EF521CF4B1DBA169C038A3DF7172EC2E62FD00851FC49E175AFC80E3BC695075AD2B8B2E77181F7FFB0900004461E4BFFD0400005047841A00001005420D00008802A1060000448150030000A240A80100005120D400008028106A0000401408350000A0F944E4FF01A4E54620372901DC0000000049454E44AE426082>|EssProgLan-ex2.11.png>|565px|192px|10sep|>

    This is called the <em|ribcage> representation. The environment is
    represented as a list of pairs called <em|ribs>; each left rib is a list
    of variables and each right rib is the corresponding list of values.

    Implement the environment interface, including <verbatim|extend-env*>, in
    this representation.

    <\solution*>
      \;

      See source code file in \Psection-2.2/2.11.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Implement the stack data type of exercise 2.4 using a procedural
    representation.

    <\solution*>
      \;

      See source code file in \Psection-2.2/2.12.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the procedural representation to implement <verbatim|empty-env?>
    by representing the environment by a list of two procedures: one that
    returns the value associated with a variable, as before, and one that
    returns whether or not the environment is empty.

    <\solution*>
      \;

      See source code file in \Psection-2.2/2.13.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the representation of the preceding exercise to include a third
    procedure that implements <verbatim|has-binding?> (see exercise 2.9).

    <\solution*>
      \;

      See source code file in \Psection-2.2/2.13.rkt\Q.
    </solution*>
  </exercise>

  <section|Interfaces for Recursive Data Types>

  <\exercise>
    Implement the lambda-calculus expression interface for the representation
    specified by the grammar above.

    <\solution*>
      \;

      See source code file in \Psection-2.3/2.15.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Modify the implementation to use a representation in which there are no
    parentheses around the bound variable in a lambda expression.

    <\solution*>
      \;

      See source code file in \Psection-2.3/2.16.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Invent at least two other representations of the data type of
    lambda-calculus expressions and implement them.

    <\solution*>
      \;

      Too lazy to write code.

      <\enumerate-numeric>
        <item>Defining custom datatype, maybe this is the best for dealing
        with many different terms.

        <item>Using list, just like the book doing in this section.

        <item>Procedure, possible, but it is hard to extend.
      </enumerate-numeric>
    </solution*>
  </exercise>

  <\exercise>
    We usually represent a sequence of values as a list. In this
    representation, it is easy to move from one element in a sequence to the
    next, but it is hard to move from one element to the preceding one
    without the help of context arguments. Implement non-empty bidirectional
    sequences of integers, as suggested by the grammar

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <em|NodeInSequence<space|1em>::=<space|1em>(Int
        Listof(Int)<space|1em>Listof(Int))>
      </cell>>>>
    </wide-tabular>

    The first list of numbers is the elements of the sequence preceding the
    current one, in reverse order, and the second list is the elements of the
    sequence after the current one. For example, <verbatim|(6 (5 4 3 2 1) (7
    8 9))> represents the list <verbatim|(1 2 3 4 5 6 7 8 9)>, with the focus
    on the element 6.

    In this representation, implement the procedure
    <verbatim|number-\<gtr\>sequence>, which takes a number and produces a
    sequence consisting of exactly that number. Also implement
    <verbatim|current-element>, <verbatim|move-to-left>,
    <verbatim|move-to-right>, <verbatim|insert-to-left>,
    <verbatim|insert-to-right>, <verbatim|at-left-end?>, and
    <verbatim|at-right-end?>.

    For example:

    <tabular|<tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-bsep|2sep>|<cwith|1|-1|1|-1|cell-tsep|2sep>|<cwith|1|-1|1|-1|cell-rsep|1spc>|<cwith|1|-1|1|-1|cell-lsep|1spc>|<twith|table-bsep|0>|<twith|table-tsep|0>|<table|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(number-\<gtr\>sequence
    7)>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(7 ()
    ())>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(current-element
    '(6 (5 4 3 2 1) (7 8 9)))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|6>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(move-to-left
    '(6 (5 4 3 2 1) (7 8 9)))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(5 (4 3
    2 1) (6 7 8 9))>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(move-to-right
    '(6 (5 4 3 2 1) (7 8 9)))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(7 (6 5
    4 3 2 1) (8 9))>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(insert-to-left
    13 '(6 (5 4 3 2 1) (7 8 9)))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(6
    (13 5 4 3 2 1) (7 8 9))>>>|<row|<cell|>|<cell|<verbatim|\<gtr\>>>|<cell|<verbatim|(insert-to-right
    13 '(6 (5 4 3 2 1) (7 8 9)))>>>|<row|<cell|>|<cell|>|<cell|<verbatim|(6
    (5 4 3 2 1) (13 7 8 9))>>>>>>

    The procedure <verbatim|move-to-right> should fail if its argument is at
    the right end of the sequence, and the procedure <verbatim|move-to-left>
    should fail if its argument is at the left end of the sequence.

    <\solution*>
      \;

      See source code file in \Psection-2.3/2.18.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    A binary tree with empty leaves and with interior nodes labeledwith
    integers could be represented using the grammar

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <em|Bintree ::= () \| (Int Bintree Bintree)>
      </cell>>>>
    </wide-tabular>

    In this representation, implement the procedure
    <verbatim|number-\<gtr\>bintree>, which takes a number and produces a
    binary tree consisting of a single node containing that number. Also
    implement <verbatim|current-element>, <verbatim|move-to-left-son>,
    <verbatim|move-to-rightson>, <verbatim|at-leaf?>,
    <verbatim|insert-to-left>, and <verbatim|insert-to-right>. For example,

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|\<gtr\>>
      </cell>|<\cell>
        <\scm-code>
          (number-\<gtr\>bintree 13)
        </scm-code>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          <verbatim|(13 () ())>
        </scm-code>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|\<gtr\>>
      </cell>|<\cell>
        <\scm-code>
          (define t1 (insert-to-right 14

          \ \ \ \ \ \ \ \ \ \ \ \ \ (insert-to-left 12

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (number-\<gtr\>bintree 13)))
        </scm-code>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|\<gtr\>>
      </cell>|<\cell>
        <\scm-code>
          (at-leaf? (move-to-right (move-to-left t1)))
        </scm-code>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        \ <verbatim|#t>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|\<gtr\>>
      </cell>|<\cell>
        <\scm-code>
          <verbatim|(insert-to-left 15 t1)>
        </scm-code>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (13

          \ \ (15

          \ \ \ \ (12 () ())

          \ \ \ \ ())

          \ \ (14 () ()))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      See source code file in \Psection-2.3/2.19.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    In the representation of binary trees in exercise 2.19 it is easy to move
    from a parent node to one of its sons, but it is impossible to move from
    a son to its parent without the help of context arguments. Extend the
    representation of lists in exercise 2.18 to represent nodes in a binary
    tree. As a hint, consider representing the portion of the tree above the
    current node by a reversed list, as in exercise 2.18.

    In this representation, implement the procedures from exercise 2.19. Also
    implement <verbatim|move-up>, <verbatim|at-root?>, and
    <verbatim|at-leaf?>.

    <\solution*>
      \;

      See source code file in \Psection-2.3/2.20.rkt\Q.
    </solution*>
  </exercise>

  <section|A Tool for Defining Recursive Data Types>

  <\exercise>
    Implement the data type of environments, as in section 2.2.2, using
    <verbatim|define-datatype>. Then include <verbatim|has-binding?> of
    exercise 2.9.

    <\solution*>
      \;

      See source code file in \Psection-2.4/2.21.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Using <verbatim|define-datatype>, implement the stack data type of
    exercise 2.4.

    <\solution*>
      \;

      See source code file in \Psection-2.4/2.22.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    The definition of <verbatim|lc-exp> ignores the condition in definition
    1.1.8 that says \P<em|Identifier> is any symbol other than
    <verbatim|lambda>.\Q Modify the definition of <verbatim|identifier?> to
    capture this condition. As a hint, remember that any predicate can be
    used in <verbatim|define-datatype>, even ones you define.

    <\solution*>
      \;

      See source code file in \Psection-2.4/2.23.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Here is a definition of binary trees using <verbatim|define-datatype>.

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (define-datatype bintree bintree?

          \ \ (leaf-node

          \ \ \ (num integer?))

          \ \ (interior-node

          \ \ \ (key symbol?)

          \ \ \ (left bintree?)

          \ \ \ (right bintree?)))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    Implement a <verbatim|bintree-to-list> procedure for binary trees, so
    that <verbatim|(bintree-to-list (interior-node 'a (leaf-node 3)
    (leaf-node 4)))> returns the list

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (interior-node

          \ a

          \ (leaf-node 3)

          \ (leaf-node 4))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      See source code file in \Psection-2.4/2.24.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Use <verbatim|cases> to write <verbatim|max-interior>, which takes a
    binary tree of integers (as in the preceding exercise) with at least one
    interior node and returns the symbol associated with an interior node
    with a maximal leaf sum.

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|\<gtr\>>
      </cell>|<\cell>
        <\scm-code>
          (define tree-1

          \ \ (interior-node 'foo (leaf-node 2) (leaf-node 3)))
        </scm-code>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|\<gtr\>>
      </cell>|<\cell>
        <\scm-code>
          (define tree-2

          \ \ (interior-node 'bar (leaf-node -1) tree-1))
        </scm-code>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|\<gtr\>>
      </cell>|<\cell>
        <\scm-code>
          (define tree-3

          \ \ (interior-node 'baz tree-2 (leaf-node 1)))
        </scm-code>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|\<gtr\>>
      </cell>|<\cell>
        <\scm-code>
          <verbatim|(max-interior tree-2)>
        </scm-code>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        \ <verbatim|foo>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          <verbatim|(max-interior tree-3)>
        </scm-code>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        \ <verbatim|baz>
      </cell>>>>
    </wide-tabular>

    The last invocation of <verbatim|max-interior> might also have returned
    <verbatim|foo>, since both the <verbatim|foo> and <verbatim|baz> nodes
    have a leaf sum of 5.

    <\solution*>
      \;

      See source code file in \Psection-2.4/2.24.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Here is another version of exercise 1.33. Consider a set of trees given
    by the following grammar:

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-width|6spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<table|<row|<\cell>
        <em|Red-blue-tree>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <em|Red-blue-subtree>
      </cell>>|<row|<\cell>
        <em|Red-blue-subtree>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|(red-node ><em|Red-blue-subtree><space|1em><em|Red-blue-subtree><verbatim|)>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|(blue-node >{<em|Red-blue-subtree>}*<verbatim|)>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|(leaf-node ><em|Int><verbatim|)>
      </cell>>>>
    </wide-tabular>

    Write an equivalent definition using <verbatim|define-datatype>, and use
    the resulting interface to write a procedure that takes a tree and builds
    a tree of the same shape, except that each leaf node is replaced by a
    leaf node that contains the number of red nodes on the path between it
    and the root.

    <\solution*>
      \;

      See source code file in \Psection-2.4/2.26.rkt\Q.
    </solution*>
  </exercise>

  <section|Abstract Syntax and Its Representation>

  <\exercise>
    Draw the abstract syntax tree for the lambda calculus expressions

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          ((lambda (a) (a b)) c)
        </scm-code>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (lambda (x)

          \ \ (lambda (y)

          \ \ \ \ ((lambda (x)

          \ \ \ \ \ \ \ (x y))

          \ \ \ \ \ x)))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      <image|<tuple|<#89504E470D0A1A0A0000000D49484452000001F8000000F90806000000CB03276E000000097048597300000B1200000B1201D2DD7EFC0000200049444154789CED9D0F745CD57DE77FCE667B0C328D4483033E943E691C68169FD807B9B871A1FE1369E33AF8A02595F10C43A3B2891436848A3D80E4408C42209181132BC42C9180542DC38C91498E58134A2BD598D07AD71451392B960534F26B4F8E01D3566E6C81DBE6D47B7ED7BF2B5FCD9B193DCDDFF7E7FB3967CECCBC7FF7BEFBE7F7EFDEF7EEA2D3A74F130000000082C547509F00000040F08082070000000208143C00000010403E8A4A2D3D11CBEA23A25541BBAF2A329EB6EDCED0DE3DC849C4B2B89FF5E5DA0FAAC260DAB60751F4D5070ABE3CAC4ADBF6FA20DE58358858D681F0DD3570492D111D48DB760F0AACFA442C8BE51E649F4740881E000000082050F000000040008182070000000208C6E00100A1241A8B371051DAB8F7D15432D15C6C594463F17622EA4F25138B1C3BB3108DC5F96D63DDA96462A7732F008503050F000825A964628A8894128EC6E2236805206820440F000000041078F01E261A8B3711D11011D5492E67C378D158BC9F8878FF947C331DA9646220DFBEF9EE361A8B37727891881A65D3DE5432B155C299ECE54CE9306634167F55C29ADDC5A4098017C9D5FF8CD03EB76D0EC777CB371F1731FA521711F5CADF815432D141CEEB8E65F4BFAC69BA291E191AE8CD925F9D8FE65432311A8DC55BA58FAF96E3F4BDB41A79E263A71D89005F010FDEFB34CB581E2BD55E112E9A0651B0BC7FA7ECAF73B12F1F43A2D41789B06A658120E1CCADACF8A3B1385F4B092E56EE2EF30340D0FA5F9D6EE7D237EA0CC3986990739501C0CA5BFA83D9C7B219C0F9D2CC8A1CC34A7BAB9CDBA1FB9F18089CCE901810FD627C4F19D76A14851F917EDC9E2D1DE02FE0C17B1BB6A0FBC5ABD63488974CE24D6BEB7E9488BA0C0193755F34169FCA9858A48F8D48E76F10C1D06BEC570226954C8C4563F10E1150D38607605EC791A6FC062068FDAF5BBCDE51E91B734ED61EBB28D75EE90B75F219906374C46DDE34F5E4BD8C3CEAC840ABFC1FC9C847A3E4AF43AEC951B89DA964626F96EBA8FB8AC6E2631285C3A43F9F0305EF6DB8338EB1459E65C66F26DA53CE16569BDD674E2CCAC3D62C0240D3605C339F779E2F3F00F88185F4BF7C987D61BE7E91334D19EECAE6F19B9C9F2DB42E910333BA978F3AC388013E06217A8F627448EDFD6A0BDD54AA75E2759384D4D8831E73B12F17632278BA745890BFC573D0E3F3BD123A1C95909FDBFC0010B4FE971719FB2623DC3D6A8CB9B7D2D9B934A548535F77C8B85E931109E817A5DD2CC36E5D19E7EBFC3421EA161CA0E03D8A58E1DD122E3F2D9D6ECC1847D3F4CBFE0619072497FB1C489AFA39E0B49CAB3C0851F843327167D4B8DE50316902E045F2F53F6312693EF8FC2639B75D8F798BC16B5E77967C6966F47907D2273954CF06F96939BF9FCE1A1A8D12991B35D230AF5927E78C48B81E936303C0A2D3A74F07FE262B0D2F8E52EEC566F4AC751E3B5FC8BE6AE4A7582A519EC09FE8C54DB0D84C6118C3002579E205F5E12DE0C103000000010493EC7C8A3143D741BE7DE5A21A6902008AC3E5A45BE053E0C10300000001040A1E000000082050F00000004000C1187C99E099DF1ECEDE52223AE6D80A803F6993D9DB7E8665710D11FDB3CFEFA39688861D5B4155C06372214284602711B1F1C1BF07D3B68DCE084015917ED94644FF4E447F8F47CC40A980820F0111CBB2888885C678DAB6FBF41D472CAB4D147D5FDAB6C7C35E4E00549A88652965AE95BA6184B7A56DFB382A041403147C80895856AD080BFEEEC92630DC1C0300282D6274F789713D67384FFAE420226CA058A0E0038A78E72DACBCD3B66DCF7797227058D11F47881080F211B1AC16A36FE634A82396C5FDD14ADB76A76327002E80820F184688CFE119B8C1180F1C86F70040E910CF9C8D67DB1C2ACB47C4B256C939AE0C75004CA0E0038211F23BE05678E403E3F300940E51D49D85F427C330E03934838E0300C80114BCCF313AFF71111E39437E0B05E3F300148F0EB517DB87C4E85E85BE08DC0205EF634470E80E5FB6F09D393E5F6A230280A02206725F2987BB8C907D0F226B603EA0E07D48B1E3EC85628CCF1F40A81080DC947BEC3C62597D0B19CB07E1040ADE4718E3ECC3D554B0C62CE0C14A1A1800F881CC67DBCB85F4C3363C330F720105EF03CA39CE5E0C22C86A254F98E10B428DF1FC7AC5226BD54813F80728788F53A971F642F1AAF1017C0D0F05BD18E02ACCB6FE7A18EF199419AC267786D35EFDA46D7B57DAB6BF98B6ED2305E6D1CD221C3D59CE73F549DBF674DAB6FF286DDBF7F06F0F9623BC1A8F138DC51BA2B1F8E9682CDE54AD9C1E7E6D8CF3A1BEFDC47B478F962CDFC3434FAB6B81E000050F3CCF7D3B76A80F000000F740C15710565203BBBF1F9AFB050000503DB01E3C00C02B344663F12122AAB3965D4477F7ECA09A25E7D1D4DB6FD263FD8F937DF41D95CDCB9737D06D77DEA1F6B1C13CF1C69BF4F023BBD53EFE7FECD8FB74F7BDF7CEEE5BF1A9CBE8C58387D4FEAF7DE5CBB4F677D7A9DF1C927E7A789FFACDE9B98143E1BD0FEDA2C7071E55E933077FFA123D31F8243DFCF02E3AF98B13D4F7DD5D73F2CA79D1709E5E3C78284D447B89A84B3677A49289B78AA983239393F4F0EE47E98353A7C86DD991381DAF4F4E39CAC02C470D1FBB62C5E5D4B2F57A47FAC09B40C12F905BBF7A0BD55F7231CDCC7C30DB31FA1E7A803EB16CD99CCE72415D2DDD75D7D7D5F6919F3C473F7C6A8FDACEFBB5B0B9BE658BEA2CF375C27C69561B2D44D7ACBE829E1BD9AF7273D30DDBA8F9F3D7CC11A04CF7EDB7D1CA2B1AD5B861E7ED77D235CD1BE9D0ABAFD1FBD3C79570F9CE430FAAE378BF16925C8ECCD25F3BDF6B4D01949E569EB779DDE6CFB5FEF8F93FEF1F79FE796ADEBC99EEFFCE83547FF1324A2513AA6D7CFDEE1DF4D4E020B5DFF2B57933C06D8BE173B97FEEFB9FCF2905CF8A9ADBA66EABDC8E75FFCB07B75F6E939C37ADE8F68FFE25ADB962A5EAAFACE0376E58A7AE3973F204DD7AEB6DAAFFF37F8306366652C9C4A2682C3E922739D71C7AE5556560BCF7CE51BAEB9E6F919BB2E3FE79E4E747E9FE6F7E833E71D132BAAFE7AC32BFF6BA2FA83ECAE5C4F7CCDF7C2CCB25E01F10A22F80570E4F284B963B8D89DEC61F5648CFFEF8476A2F776EDEC68A7BC3DA35B3C7B0806021C09DB0E6DC73D43656DCDC91B8139AE44AD30BB0103D72C49EBD4713F674783B1B334F3CF1C773F6ED7FF92075767E4D297E16AEEC09318FFDE007EA9BCFE5FD203474A79289E9D6F88D6FB1C177E4C8119A7CEB2DE5956E69B95695011BB51BAF5E4B875E3BECAA4CCE5DBC78D61058BAF4029AF9F043F57BE2F061B54F2BDE356BD7CE398F8D6A9E70667E5841325B366FA27D2F8CA8BECBC6391BDDAC109925BF7A1E4D4C4CA8E3BFD47EB3CAFBCCCC4C66B6A653C944339D313C9A53C9C48023E30B645B6C9B32301A3E7919B92D3B360A565CB65C9DC3E7AEB972F56CA27CEC952B57D0BEE167CFF4D5911175AE763A803F80075F00DCF0B5F59EA970173A0B35572764E5D76E1C972FCD6AC3825287F2CC905E4D4D0D6DEFDA3EEB4565B26553B3122E5A70CE9C38A184260B4C3608B4C082F71E3E581173FB592899CAB4E69CC559AFC0C7E5DAC7E8907F36D6AE5B477B7E34ACBCE463C78EA9BEA9A369038F3C42C7DEFFC7D9081B1B0A5998766E2A1D6ECB6EBEE3363637ABE1088E40B083C1F704FC053CF802C8D62938DCC5563D7BA3AC80D9532F779A5E219BA064CF86872536AEBB5A95078742DDDC13873873ED038147D9B4BB76EE5CCF46617D7D3D2DBFF45265406A4F928D41367E3924AEDBC9CC87A79461C87D9015911B962E5DAA0C4F6EA77CEE9EE41ED765CB86271BA7FB5F7A590DB7B122D4B072E7681C2B770E6BABBC393DF892C31E36C97C00B765C7C37E3CBCA623117C3F261C9AE7881CF76396675E1812040B030ABE44E84ECC9D8A3BD211FBEF69E6830FE75C9C43ECBCDD64BE4EE857DE7DE75D95F3FAE5CBD5F7A143AFA86F1626F96021C2E5C1614E86BD073DEF00041F7E1EFE95C3FFE71E9E9FC1E17356A6776DBF43F5258E8EF1B8308F29DFD0D6A6CAE23357FD8EFAE67038879CD99B760347C35879F178359F5B6F5DB2A0B2FDCC55572B45CAD76045A8E150390FB1715ED968E0BCF2DC14363ECA0DA7F9FD1F3C466ECB2E76E31F50CD39E7A8FBEFEBFBBE52F8996C6CFAACDAA2872080BFC09BECCEE0BA1038E4C6B3723327F8644E0CD33377CD59B4ACDC78228B9ECCC356315FC7CD24BB6C69BA64838B97BDF08B6EEE716C7541E62C661373D2210B1D365C783882437D2C6CF404273DE94EFF67CFC79C11CCB0576486FF17C04B2E5FF603BC03DE64E711B6DF7E87327E0A943DF3DD33283350F0670872219455C1FB002878FF01055F65E471BE398FDC95E19E419981823F03143C143CF00EB5B2FE424578E367E34BBEF7E0036D175C70C1E4B7BEFBBD172A9066B6FE58D17BCEE4C98147971F7871FFEFAFDFB0F1991BDB6F9E741C503CD9EE19941928F83314A500BEF1DFFF68D3D1778EAE2A63E72886715908261F967C3CC50BCFFEF8C2BD7B526DE7D7D54D3EF83F069E29306FC7A50C007060ACDBCE8B3985BA9DC8C251BCB8D571AC331F0CA0E08B206259EB653D665E9F7DD8B737E271A49C3BB124262825B252A395B6ED4E14EC59649D79FE746275487F03055F0011CBB20C4BB7C77737E0532296D566081EAC3F0F0AC258437D1086797644C6F54819C1A8F62950F00BC0086159B06EAB835107B51256451D00D718D1A036B49DF98958967260E0C8F813287897C07BF4168687318EF142E00628ABC2308C22C83E9F01053F0F18FFF536A81F900D8EF4680F5D8CC13E4CA42B1C899CF599F38DCC3206DE040ADE4066D4B6B0850F0FD15F488465BD28FA7151FCB518630D1FA28CB8DF5A9830565AF4C444FDE481287C18D61E050A5E10A1C0E1275ECAEC14C678FD47C6F8FC2811F1AA3CEBE1B5850B09C5F37B1DBE278A7E30EC65524AC411E27EC6EF05FE381B52C1B9BB608177D19F85ADD08FF12B9A89E8C7FCE80C94BBBFE0FA92F1558EB87C4BEA7350143F0801A27CF44B9BAE429D978D5FE135ED89E837F4DC06E03DA0E0CF080556087A75975F27A29F4A881EF80C51E6078CB782AD9447A24038D0C3697FC7CBBED3D936014A07CBC66344A417E5EF84BCF4262509D1472CCBCF6330BC263E2FA37492887EE9E2AD6F7E60BC122FEF9071EF36C70EEFA0053B7FBF2B432F5EA713430A7359807C592C757DDC6D5DA76DBBAAAF319688839FE7F87C54CA3C28B293E4D9FF4038051F756C29906A771470960A1A5C96CC53C0249B1220A14E789B5928877CF18863A2224E7874CF1BC8E4DCC0E83284E8010000800002050F000000041028780000002080946C0CBE50A2B1789A881AF4E9A964625109AEC9D7E3EB36A7928951C701CEE34724ED66C74E0000F020869CD38C9642864563F17622EA772B8BA3B138CFD4EE4E25133B1D3B4155A9BA824F2513113AD348BA88A8D7710000000007A964628A9F8422C34901C004217A000000208054DD83CF8784A086E48D496486A024B4CFE1770E270D4898BF89C3F2443425C7374663713EBF8E88C624643F9D715D7DEC14CD93A68BFCF239FDC6B97B53C9C456B9265BD85346FE5F956B77CBBD4C493E759EB6A6928931472201231A8BD74998B123954CECA5B3DBFE490FB18877D264D453B3782FB3E1440E1112519794E1402A99E870515FBD728EBE6E87A4A7A3493AFD564963B51C9B9636D79AD9B61C8980B293AFBE743B0923D158BC4964599DDCBE0AA31BA1FD01919FDDF2CDC7458CFE61465567FB54C675E7C8A85C69BA297EE9CBBD59F29BB37ED11FF3E3070F7E40C682CE1785DD6EECE3C6D4218D73543E8DC6FE5669B0AB65BB3EB75FBEF99A5B1D29E64F331F43A2D41749BAADDC1845C86C956BF58A62E1105BB771AD4669D07CEE7458862BA413EE35EA86E4F794317F820DA14552365386523669957AEE76ECC982D4A96A1F72DD515DE6229058600C89C0EA17E56F2A8B46492F22C6A5DB36024A8CCBFA0A2BCDD2BED9B1E815E5AE6165B853DAFD56C3C1D034C8B9CA00E0B215E3DB94730359CA355F9A599163FAC5B15924729DCFAD437F2C1C4F7BF0A2E8B851F51BDBEA8CDF3BB5E72D965E53C6F9DDA240C6A2B1F89828D83A310CCC7D6643C9996696492D248A2822693748A334957383E48FD3E990CE316D589F9ABD8642DB1BB2F9085C8F692E432983AE4C452D137934D9264EEA0EBFD338A73F4B47E7E3B4B5DF20E93A2EC6DE8A4464387AB05347170C068C28C298B4294C32AA122EEA2B8CB09CE99772D1341851CB6EE907A3229FE6149111051B1079D428B2B04E2B76EE4B19B232679A46B4CD4447065A65DB48463E1A257FE88F05E07505DF2F8D83BDAC290965174A9D343E6D20E40ADFE44CD39CD49287AD591A9F465BB27519864A267579F21738A49C47C54BD006911220129EEB32C273FDE65317068EF212C1912F543F964A26320D2DA2B3C304BA8EB2A5675267084D500516585F616144DAF8A21CCE895B4C99399FFCCC99A6F4E96C1EBFC9F9D942EBE88F85E1F5103D57E4B4288026178A3113E5BDC9984D8334BC29EDA5D3D950ADE9F9179AE6985CB74B2B29FED6E17DB13E7B256C352AE126F3BA8D727C8358B3B98C84A0B253EEBB2BC3F2D665342665D3B8C036908B5129F3D9703FFF36EAA45F8FF7CB504BE6B0402B9D1D736CCC1155009563BEFA0A158642D4ED527BC8AEFB8E51863A0A366A8CB9EBF6DF6F1C5F4C9AFABA43C6F59A8C4800FA6301785DC1778B103E2DCA714C14A8EBCE2BE70E4958475B8F5B250C7F5A1AAF3951A4A034C5EAD493F1D2727E9AE64EDCEB9610B41EF71FCAB84C5A3ED36EC792838294CB9419FE130664FB3F69EF40EAA7A8C782645CAF5B86544E4B7D6921D1254262ABE44B1F671A827572CE888407E7F34C409970595FA142E4D16CFB96F2191399E3A65CA63364A41A029389BFE675CD3E9533CDF9EA42EA8DA36D0D467FEC477F2C8E92AD2687C5660A473F11E066E6B71B2A551FB238CA81302D3663841D3B4A2D44C2589E6E28577BF682DCD28B9B60B199C228757F0C5A7DE039780000002080787D925D28D06FF303DEC7E5444B004005407FCC0F3C78000000208040C10300000001040A1E0000000820A51A835FC533521D5BFDC74544F40E1AFA82E88B58D6718FE771897C9F74ECF11616CFA2F7781EAB41B9E4CB2AC796EAD026B3B7FD0CF7B1A50178C14C2D110D3BB6FA94923C2617042296D54744A788E8C2B46DB785BD3C8284169E78FC0C80D213B1AC363196B87F715FEB49DBB6D78DFE5010FA107DC4B26A2396C516DB60DAB6F9050AC3A2EC010000E441CBCAB46D77A66D5BC95189EA79253A126A42ADE059B94B83648B739CCE3454D548B9E1CA7E0000007365A7653846837ABBC8D14E19766841995597D02A7851DE6C7DB669E5AE91FF83E2CD43C903008020435E3DD964279D919FC7D9A3E7392588865697502A78091FB1F5D9996BAC481A6E9B849BA0E40100A1475EA7CCAF726DCB253B3569DBEE1327098E5295089D8217E5CED6658B8B066ACBB18318530200841599AB34286B25B87E4FBB4C6C6D13450F195A6142A5E0654CA8CD8DF5A991E3B881F6A0810200C286C83D3D5769C14FA248C87EBD8CCB773A0E006523348FC9C9A31CEB8B79044EC69306B38D3B01EF82C7E400280CFD089C8CA9178DF1481D1EA5AB00A1F0E0A551D516FB7CBB34F24EB91E00000416F311B852DDA3CCB8C7A3741522F00ADE68A42599CD29468205250F000822B91E812B15C6A3749D7894AEBC043A442FCA7DBC1C8DD4880AE031108F83103DA830B51E7A0DEE82D8FDC0B757FDEDDFFEEDA6DBB7DFB5FB539F5E95EBD5CEF3F523D7F77FC77F6BFFFD13274E5EF8832793BB1D3BCB0F1B1A811E2670ABE0833C50BF214B83E559A2F7388EF41EDF94BC823C40C1830AC3EDEDC50017FA7CEBAFFBE5FEB3C9FE40E108D14763F186682C7E3A1A8B3755F346A3B1380D0F3DEDD85E6DDE3B7A54E5EDF06B6345E784EF8FAF0500F02F5E90992C8F4A2597CA09E4676571287800000000F81F28780000002080E45B0FBE311A8B0F11519DB5EC22BABB6707D52C398FA6DE7E931EEB7F9CECA367964DBF7C7903DD76E71D6ADFC0EEEFD3C41B6FD2C38F9C992FC1FF8F1D7B9FEEBEF75E1AF9C973F4C3A7F6D0F52D5BE8E9E17D6AFF35CD1BE9863FBC49FDE690CDC3BB1FA50F4E9D224ECF0D33274FD0ADB7DE46FFB5ED465AFBBBEBD419BCED4BED3753F7EDB7D185175E447DDFDD3527AF9C170DE7EFAFFF662CF9AFFFF6CB3F25A22ED9DC914A26E64DFDC8E4E49CFCBA291FE6BE1D3BE8F5C9334B269BF7699695868F5DB1E2726AD97ABD237D0080E7A8A8CCE410B5DEEE5666B29CED7D68173D3EF0E8AC4C3AF8D397E889C127E9E18777D1C95F9C985766BE78F0509A88F666C8CC0147627980FCAC0CF93CF8569E9F4444ABB9B0479E7F5E29CFFBBFF320D59C7B0EB112EC7BE8013AF2F3A3F4D4A0FB49EA875E7955352E6EB4CF8DEC57D7E40F57F69A2B56AAEB6EDCB0CE715E36B8D2F99CFDA37F39BB97F379415D2DADBCA251FDE76BF135394DCE2B771A937FFDB75F722B694C25133C7164344B3259E1FBE00E71FF37BF416ECB873B24FFE773383F26D75EF705D570F5D8147FF3B1CD9B37674B1E00E03D94CCBC6EF3E73ACA2D33593EB072BFE9866DEABAF5D6258EF3B2C17291E523E74DC3F293E5A856A2F3C94C226A28446666DE13E467F9C9E7C177A7928969221ADB7EFB1D74E4C8119A7CEB2D65716D69B9561DF08965CB68E3D56B69FFCB07A9DD717A76BEDCF125D5906A6A6AD47EB618D3936FABEB367DEE3FAB6DCD9FBF4659AE1AB11AE75C8F1B361FC715DB79FB9DAA42B9F1EE7B6184B67DE1CCA3954B7EF53C9A98989873AD99999939D7F9C8473E72E2A9C49F36F3EF5432D12C9BE79D99BE2DB64DDD47C3272F5396A49BF2E146BDE2B2E5EA1C66CD95ABC9160B9C8FBD72E50ADA37FCACBA8FFD2323EA5CDDE900009E47CBCCB75E1BFF595965E6C4E1C374EEE2C54A062A59B276ED1C1979EB576FA1F7A7E73E01C60A93D3DFB27913EDF9D1B0527EEFBD735429C62F7FE52BEA1837329388A6B5AC3464E68280FCAC0CF914FC2C331F7E38DBB816429686413535CE029F397122E73EA6FD96AFA94F36B862398CC3157AEC9D33611DDDE8071E79848EBDFF8FB30D9B1B7D261FFD0F1FC9F5ACA76BDC96CF7CC76D6C6E56E133B6985F393CA1F20D00F01F65979933335473CE62C7768D0EF96763EDBA754AC1B3D77CECD831A518593E924B99C90ADEB1A508203FCB47BE10BD3230A3B1782B5B82F5F5F5B4FCD24B95D5C85612C9230F6C5D7178875443ACA1990F4FA9500B8753B890DD10B9F493EAA8FFF5572FAB6FF6D817025B7C9CD6BEE75FA02D9BCE1A94DC5039DCC30D953D7C95B72C1DA810D8A02019BF725B3EF5975CACC6DBB87C78AC69FF4B2FCF49992D4F3656D87ADEB076CD6CA70300F802253377EDDCB9BEDC3273E9D2A54AEEB01CE173F724F7388EC9057BB52C2759FEB0D7CF8AB11232D304F2B332E4F5E0F9D94E92891DDA2BBE6BFB1D6A12847EFE900BF486B6336F6DFDCC55BFA32A8427B971D8852DC399990F1CD7CD84432E7A22097FB87216821E57E2C6688EB9701888C7F639AF9C9FFA8B97A9312CEE54A59878A1CBC06DF9C46EFC03358185CB87F3CB0D36338CB6B1E9B32A64C6430F00007F512999C9F26B62E275BAEB9E6FA9FF2C33F5C434377CE6AAAB95ACE5BCE8F94A5401996902F9597EF026BBEC6F33AADA9BEC78BE034F98C935249101DE64E702BCC90E5418BCC9AE4AF7BF40F9994DF6078ABC1E3CA81C7A22215BCDDA62050000303F909FD971EBC1AF776CA9106FFC6C7CC97DF7ECB86FD3EFFDDEEE1BDB6F9E2C43AAD9161CB0E453729E1C7874F95FBFFCF2A6122DAE60CB07E4011E3C080311CBAA95A5587B64C5B6C023F7CC0B7E0DA76D7B180D7D2E9E5E4DCEA83C6EB0815164B20E32DF574BDAB603BD9A91178082074147DA382FC1DA16469912B1AC4E59DD13439606F966D1571551826C8D760649B9D3DCF590FBC4880100808210E5B63E6DDBA1751864D9EE03BC8E3D64EA593CA9E045B9F704D91ACD50F265190E00000417566411CB6227C886E73A1BA163993A283A24F4784EC14BC5B485C11A95FB438304002C086398AF0763CF67E1682FEB0E96AB11CB0AFD6C3B4F2978A9100EC9773A76061451F2DC20DBA0E40100F32172B22D88C397A5226DDB4AB9472C2BD4C3A05555F01C9AD64A4D1AADA52B264CB09217A3A64D5B9D3C69066349C521ED4B872E977067F7EBBD80F012B1AC167DF3BA0DB3BCC004DDFCA46D7B50E6710DEA615096AF6192AB559D452FE347FA718EE35221A146CA84C792564999847E6CAD182296C51E0EBFB47B09113D13460312F817718086451E84EA11B852613E4A27E5486191AB55F3E0C5A2FA2211F12B87FE15CAFD0CA2803E4E44D7C93812BCF8E2E08EFD097E05B7084800FCD67E7F838886646E1294FB02910829CBD5DF26227E07EE3D6199D85CCD10BD1E67E7B5851F11CF35F448393C4844BF4E441F93F1795038BA5DFD1D9E83077E4242F3EB24CBCD126A86C15F00F22821AF891B91B343315C57B210BD343CB793C4385CCACB1FF152AD2FC8E75DC75167395E0ACB55C25D7EE820CB8968937CB88CB6398EF00625A99742100BDCAD15DE2D43412F38F664671CE39BA01C2CB0DDEA25E2FE4ADAEFB8C8835CD85E9874E76139CB72F52AF9B0A2BFCD1822F63205CBD952BE8B5E3FBBEEC64BE2CA7FC678CDEA6FCA2717EB4BF4BADC3E1F2D2E30219FDF142FDE8B0AA754F552086D2228DD08B4FF67E4773ED62FA01D03B050DCB6DBC5A2E075BF6759BDDA71D459F435BD30B6EC6539AB5FEFBD58CACC0F0E5FC172B6D48BCD1C28C7E485886595ACB160D25AE92865BD14C860A9C3EEC6AC7B00FCD46EAB696C3B809C2D1DC5C859CFBEAA16000000008503050F00000004102878000000208040C10300000001040A1E000000082050F0000000400029F56372F3128DC54788A8498E9BE23734A59289293F156D34166F925747D6C9A6EE5432B153F6F5CBFD4D19F7D9914A2606F2ED7324E24CB39188F8FC46D9B437954C6C8DC6E2FC26402ED3A95432D12CC7BE4A44A3A964A2BB98348380DC7FBB712B3BB95CC270EFC07F487F4E8B5C1CA5B9F226924A26A6C352AD90B3C5530D0F9E0B64117FA430BA1C47F88366B907AEEC5E69009A067D9FAC50647F9D8B7DF91892C6B648DEC2D41A8DC55BC538DACA0D321A8BF3B57AF91A194AACD0347D8DA1DC3B8C36171A0109FC87F4E7810CB9D825866918DB2EE46C1154DC83A73382D77C3FEEA8E300EFC31DAD5FAC3D4D83182C2456DE4EE3FEBA0C8B30EBBE682C3E2596BB1B797C0D0000157349444154091F1B114BB6411A4C6F469ADCC8C6A2B1788734CEE92C6FBCCA9AA64FCB7E2170B90D9856B4510E0078156EAFAF4ABF9F9676BC3584B505395B241555F0D158BC4B6E5A859FC4C36A701CE87D385433C6969A1152CB85B6E0B259DFB3FBC4425CE438622E5B53C9C45EC7D633E872AC33AE9B8D7CF90922F9CA0200CF218A442B88293152C3E8BD43CE1649A543F4FAA6C7A4C21AE72924CF2121973AC32A6BCDB837F55BAC419210315B76632EF6E5624C1A4A970E51F17734166FA7B3E346BD12C6E27C0D6584860A4933088C4A886D760C5E8C4C00BCCE4EF1DCDBE577A8809C2D0D9556F0036291FE93B6CE246C32E238D2A38825DD2D619CD362A48C49653719B9EE97FD0D59C26BF9F63990349B657B5ACE55D6AC34C4219980326A5C6FA8983483402A99E89036A7EEDDB87F00BC2E674645AE0CF86D127229809C2D0D150DD14B43CD1CB7E8701CE871649C25AB55CD133224141471EC3C43BE7D39114B30D76A52B3D793469A79FD82D20C02A2E47DD7C640B81139D218D2B17705E46CF15465921D000000271963CD1D61F4DE41E980822F31E2316625DFBE6AE40700E02D5C4E020B3DF9E45ABE7DE5C2AB72166FB2030000000208143C00000010404A1DA2B72296B5DEB1D543783D7F6041AC8A5856A94BACE41704208372B4DB558E2D550472D61B9452C1DBF22947C50E3AB6147E1DBF35BCCB89E875C7566F50AA7A2984035297A5AE4FDD8E01F053BBD5D7F6027E91B39F24A2B71D5BBD47C17276D1E9D3A71D1B41F58958CAC4EF21A249796CA3336DDB503C0000500411CBAA15D9CA43D4FF9EB6EDCEA0962714BC07895856A7848A7BD2B67D5C1A641F110DA76D7B38ECE50300008560384E7D69DB1E8F58D62A91AD2D2C6B8356A850F01E421A1F37B6C16C8A3C62592DDC10C59B0F5C630400807221CA9C957B9B293FC5811A14876A3C48150005EF112296D526E3567995B7D118B31A010000001C7253C9D7B46DB739769E3D869DABF1B46D57736E51498182AF328586DF258CBF0ADE3C0000E4266259ACB00FB851DC22576BD3B6DDE3D8E943A0E0AB48B1217723A4CFE3495E99410B000055A7D0D0BBC8E5F57A0E94E3001F01055F050CAF9DC3417DC5E6405B9DA2E8E1CD0300428D8CB7778A925EF0D347C59EEF15A0E02B8C58876DA57EEC0DDE3C000094CE030FC2E43B28F80A218D852DC2E3A5F0DA7311B1AC1EF1E67D1F5E02008085508E31743F4FBE8382AF00F2DAC6B64A857B8CC74102F7D80700006462BCBCA62C8AD8CD2C7C2F02055F468C4677BC1AB332C59BA7A0CC080500804C2A154ACFF51CBD9781822F13E2B57756DB8B86370F00082A957E135DE69BF01C07788CA028785829FEE3251F2EFC034058818CF53E0E998AF5E041C1DCB76387FA000000289E52CB5428F805C0053FB0FBFBBEC92F0000F809C8D8D202050F00000004908F86AD526FFDEA2D547FC9C53433F301BD3E39A5B6F53DF4007D62D932653DEA6D17D4D5D25D777D5D6D1FF9C973F4C3A7F6A8EDBCFFC58387D4EFEB5BB650CBD6EB69EAED37E9B1FEC7C93EFA8EDA7EF9F206BAEDCE3BA866C979F3A6592ED80A9E78E34D5AB3FA0A7A6E64BF4AE5A61BB651F3E7AFA1E1A1A7E9E9E17DB32977DF7E1BADBCA291DE3B7A943A6FBF93AE69DE48875E7D8DDE9F3E4ED6B28BE83B0F3DA88EE3FD7DDFDDA5EE93CB8759FA6BE757A6E20000BE209FBCF3B38CF5A34C0DA507FFCAE1095AB1E2724A251373B6EB6DFCE1427EF6C73F52DBB902791B37AA0D6BD7CC1EC30D6FE6E409BAFF3B0F52CDB9E7A86DDCA88EFCFC283D3538E82ACD72C28DE9C8117B36EF268F0F3CAAB673077AE2893F9EB36FFFCB07A9B3F36BAA9172C33BF8D397D4F6C77EF003F5CDE7F27E0000C8462E79E77719EB37991A3A0F9EB972E50AD57098CCC6108DC51DC7E763F2ADB7E88353A7684BCBB5EA28B618375EBD565568BBCB34CBC5B98B17D3DDF7DEABAEAEBF999A9A1ADADEB55D35D66C6CD9D44C0D9FBC4C5997CCCC8913AA93B165CC8D97AD66DE0FEF1D00908D7CF2CECF32D66F3235941E3C5746261C62D9F7C288B2B0B871B01559EE34CB4DCD398B1D2970A88B43611BD75DADEE93434C6EF27AF2172772EE030080F964481064ACDF642A26D909333333EAC7F24B2F5556D611FBEF69E6830FE71CC3E11FDE6EC2C7B355B76FF859B595CF65CB72CD152B1D69788177DF7957E5A27EF972F57DE8D02BEA9BADC97CB0D5CCF7393131A18EE231333DD60500006195B15E96A950F042D3E736D1D2F3EBE84BED37D3FDF77F9BEAAD4BD45889F94C62F3E6CDEA9B434CFCE149171C5AB96BFB1DAAA1F2369E50517FF132BAA1CD9BAF2C5EFBBBEBD4D851EF43BB547EEBEB2DD5C8F8BEE7E3D65B6EA6893727D579FB5F7C494D16010000370455C67A59A6E24D76A05A38DEBA0400F02C90B1DEC72153E1C103000000012428B3E83738B614C0EE07BEBDEA6F5EF99BDF8FDE78E3EE4DD75EF76EA56F220B17F25C0CF9549D27071E5D3EFA177FD1F65B57FED633B7DCF9F562175AC83EDD1400E0454A22633379E1D91F5FB8774FAA6DFD868DCFDCD87EF3A4E380D273A17C4C262B25635986BEF0677F76CBDDDFBCF7EE4F7D7A55A9D374C854AC267776B9C14E59D6B5CF7100C82C2F5E4DA95656A873342A00007021777DB7FC6A29A8D4F2B604053F6759D7CEB46DDB8E034056A47376FA65D944008077885816CF905B95B6EDCEB0564BC4B2D8991C4FDBF6A063678908AD82172BAA47BCF61EC701C06D39AAB243190200DC10B12C566807CAA9D8FC42C4B2D8C0A92D97FC0CA582374243650F918401942700603E2A199AF61311CB6A91D9EF251FF20CFC2CFA88655919FF5911B5A46DBB058DAC34483972C8AD4D7BF41AE9D4008090C17D5FCB5F7102FA64281472D7206DDBC362F8F419E56595427606DE838F58168F71ACC2987165C89CD310B12C0EC5E1797700428684E287E5AECBE2A1060933C221E55574E83ED00A5EBCC97B88E89B98F55D398CA712FE8588BE4D44B7E1E90400C28378A24788E8CF89E87F638E8E7B64F2DD7FE2F57388C82A46670536442F1EFB3DF2F7B7D9328272AF0C52CE0788E80649B02773A804001068B442FF1C0F89CAAC79300F524EECBD3713D1C76458A360823C066FCED05C2C8D0C4AA6024839F3C4917F90D43E96511F00808022C3745F24A27F26A23F91C829FABF3B8645A9FF8994DF178BD15BBE09D14BD877956347762E946327E5331FC7312EBF3016581FCBE5D8BFE2C5971C7B9DA03E40283126A3F9193D392C2811D3C1521A283C2FC9B131371F27A25FBA2CCBF1CCF70AF8E955B5FA512CB785738A882E96CF7CACC7C2270B66A1F5C1DEFC6FCA673E501F20ACD4CA33E218B3F600128D28B92C2AC7C4E36C8683DFDE455F96869FAD60802B501F0000E051B09A1C0000001040A0E001000080001294E562010020D44463F1061EDE35CA6034954C34175B26D158BC9D88FA53C9C422C7CE2C4463719EB9DD9D4A26763AF7824A02050FCAC642050300A07052C9C4143F194567FADE088A1220440F000000041078F000001002A2B17813110D11519DDCAD0AA31BA1FD0122E2A85BB77CF371115D32D158BC8B887AE5EF402A99E820E775C7CC92CC95A69BD29608606F96FCEA7C34A79289D1682CDECA9142225A2DC7E97B6935F2C4C74E3B12F120F9EE4FA234AE099C07CFA1291E03924F5A1A2FA86E9D741975D2EF38000050299A65C88CC7E67B33E4232BC39DA25CB6CAFF46637F839CAB0C0056DED158BC4E14F85ED93790E53EF2A59915398665C55639B743CEAD130381D3191203828FEBC8507E9CEFD562A03488C1E20B5CDE9F2B8218A2E789258BA451708174398E0095C62118500300541CF660FB65129C1EA337956DB71CC332742C3373DA633794382BD126310406E4984C059F334DF6D00DC33FD3016895EF1139B7DF4853E7654AAEC9D184BD19E9F2B629518A63924FDFE0E2FE5C11C810BD3408CDA8E3005051320443AF7452D40B00958595C5181BDB5966DC2F041D329FCEF89D8D9C698A3190CDE337393F5B685D22073AEDF9220275A22C7DC302EF2F2781F2E065ECA2CB0809CDD7784065994F180000CA80A130B461AD3DE43AB7A9897C2523DC3D6A8CB9B7CA31FDC6F1C5A4A9AF3B645C8F8704F49041BF286D0EFBB71A79D3E8FC34F9D4A198EFFE5C11B410BD6E3863622D362EA40183F290433000002A8478C1DD328E7D5A64E398285037E16B3EBF49CE6DD763C212CA37AF3B4BBE34E71BA6E3C96532EEDEA0C3F73A4C2FF2A451C6E7478D34CC6BD619C3020359860E3C8BCBFB73859F5693532FFDCFF7EE7351EA43523853A248DAE77BE103BFFBBC1C2FFF0F322EEB43CF82D56360D33213366F67437D80B0E2A65F81DC18C3006C80E495336E28477D944BBE65BB6EA0C6E06542C5EA8CCD1D8E0341457039C6060000A00CE0397800000081C07C9B1FC09BEC000000804002050F000000041028780000002080F86D0CDE92598DC01BA03E00283D6D01E857B5FC921ABFBD60260B7C1FC3CECD45B18A67BC5722F37E52F0B67CCAD1F0071D5BC07CA03E00283169DB66C16FF9B55C2396C50AB153FE1E90DF3D69DB1E771C1C52D2B65D5BA93BF7CD73F0000000BC4BC4B25A38FAC04A3D6DDBB6CE68C4B27AC41366457F1C555839A0E0010000144CC4B238E2D0C791B7B46D670D67CB31ACE887731D034A0F143C0000808210EF9CE973E39D472C8B43F6ABC49BB71D07809202050F00006041C824C04E51EC0B9A3026E3F4ECF18FA76DBBCF7100281950F00000005C21CA99BDF6E3C5BE9F5D8C843631123009AF0C40C103000098179944D752CAF07AC6AC7B57617EE01E2878000000393126C8F16A65657984356259AB44D10F2E34E40F7203050F0000202BC6A4B8CE4A78D7954E2FE840C1030000988378D43D854CA22B1623628049784502050F0000E5A7563C534FF3C6CFC6977CEFC107DA7EE557FEE3C99BFFE8B6673EF5E955275DE6B71023C0CAF7D6BEDE6F6CBFEAEDC9C9AB5AB74507375D7BDDBB8E03CA074FF80B44F4000A1E0000CA0FCF187F31C0E55CC81AECECA5DFE3D85A7D361468B0780EAC2607000025261A8B374463F1D3D158BCA95A657BF8B531CE87FAF60BEF1D3D5AB23C0F0F3DADAE1566A0E0010000800002050F0000000410BFAD070F00007EA2311A8B0F11519DB5EC22BABB6707D52C398FA6DE7E931EEB7F9CECA3EFA85BB97C7903DD76E71D6ADFC0EEEFD3C41B6FD2C38FEC56FBF8FFB163EFD3DDF7DE4B233F798E7EF8D41EBABE650B3D3DBC4FEDBFA67923DDF08737A9DF1C96D6DB393D377038BCF7A15DF4F8C0A32A7DE6E04F5FA227069FA4871FDE45277F7182FABEBB6B4E5E392F1ACEDF8B070FA589682F1175C9E68E54323150683D1D999CA487773F4A1F9C3A456ECB8DB96FC70E7A7D72CA71FF66196AF8D8152B2EA796ADD73BD20F0AF0E00100A07CB4F2935FD76DFE5C072BA591E79FA7999327E8FEEF3C4835E79E43A96482FA1E7A808EFCFC283D35E8FE1D32875E7955296456F4CF8DEC57D76445CDCAFDA61BB6A9EBD65B9738CECBC6CA2B1AE982BA5A9537CDFED1BFA43557AC9C559C1B37AC53D7E43439AF6C6864D0C0C64C2A99E0C976A3599259107C7F6C5CDCFFCD6F90DB7263E386FFF3399C4F936BAFFB8252FC7A6C9FBFF9D8E6CD9B03DDF4E1C1030040F9E84E2513D344F4D66BE33FA323478ED0E45B6F29CF744BCBB52AD14F2C5B461BAF5E4BFB5F3E48ED2EB3F1E58E2F29E55B5353A3FEB3973D71F8309DBB7831357FFE1AB56DCDDAB5EC59CF9E73EB576FA1F7A7E73EFDC54A92D3DFB27913EDF9D1B05278EFBD735429C32F7FE52BEA9825BF7A1E4D4C4CA8C88166666626334BD3A964A2997FE8EF62D816DBA6EEAFE19397294FDC4DB9B151B0E2B2E5EA1C75FF57AE265BA2197CEC952B57D0BEE1679541B37F64449DAB0D98A002050F00001560E6C30F6715F242C8A24CA9A6C6A998F8B89A73163BB66B74C83F1B6BD7AD530A9E3DE563C78E2965C84A911978E4113AF6FE3FCE1A036C286461DAB9A934B82DB7F98EDBD8DCAC862238FAF0CAE109753F4107217A0000281FCA29DFB573E77AF69EEBEBEB69F9A5972A4F9BBD499247C3D80BE5903829E55D43331F9E5221690E3BB33272C3D2A54B9587CEE3D47CEE9EE41ED737C59EEC964DCDB4FFA59795D7CFCA50C3CA9DC3E2ACDC39B4ADF296C5E82825EC6193CC05705B6EF5975CACE62EF0BD7319F0BD98B0E7CE63F61C89D8B076CDAC011364E0C103004019E1E7E14926C3E9F0F95DDBEF5093C5F473DAAC786E686B53BF3F73D5EF28C5F5A5F69B55789ABDE999990FE6CD204F169B98789DEEBAE75BEA3F2B313D19CD0D9FB9EA6A3586CF796165A8E170394F78E3BC727EEA2F5EA6C6FDD91029E704355D366ECB2D76E31FA8C9805C6E3CA780157EE690C4C6A6CFAAE1071E930F0378931D0000941FBCC9CE49C5DF64B7FDF63BD4E4C3F65BBEE6D867109837D9C1830700001068E4513E1581D01E7F1880070F00003E2562592D44D426CBABDAA8C7FC442CAB4716FEE909C372B450F00000E0336449555E4A75306DDBC3A83FF7C852B8BCEEFC70D0CB0E0A1E00007C44D8BCD07211B1AC4E59C2B733A8E508050F00003E403C4F56EE7D69DB0EC424B06A13B1AC5A89848CA76DBB2F68F707050F00001E4694102BF6E369DBEE415D959E8865AD97B90C6C3C8D07E5BEA0E00100C0A3C824BA1609C763125D191143AA5352E80B42D81E0A1E00003C002B18AD5464121D7BEB07D2B6ED7E151A5034D9864244F993DF943E143C000054190911B397BE3E0C93BFFC80590FF2DD92B6ED4E3FDD03143C00005411F10E79DCF71F88E8E79844E71D8C48CABBB2D6FD7FF1D3A375586C060000AA0B87E07F83D75327A27744D9030F20F31ED8D8BA497233A8C3F57E000A1E0000AA44C4B278E6362F70FECF44F41211FD8B4CAA031E40C6E3D98BFFBF44F47744F4317E418E5FEA06217A0000283111CB721B625F4244A788E8978E3DD96165D386107E6990B90F1C4159C8130AECC1BB9A1BC1732A1C1B2B08169B01008032500EE12E6FB103A565B01CEF17588091573610A2070000000208143C0000001040A0E0010000800002050F00000004102878000000208040C10300000001048FC90100408589C6E20D4434424453A964A299CE6C7B95884653C94437EAC33B4463F134110DA492899D74E67F1D3F0549445B53C9C4A897F30E0F1E00002A4C2A99986205C1AFA78DC6E2BDFCA133DBA1DCBD072BF62E51EC4C3B118D795DB913143C0000548754323146441DB28849BB287CE03152C9C480E4A85DBEB9BE06FC504F08D1030040F5689094EBE403BC89F6E23973D3A96462AF1FEA091E3C00005481682CCEABC771689EC7E039DC3B64848181B7D01E7BAF287B5F00050F0000154626D90D1151B78CE5EAF0FC10EAC27BA492896951F25346C8DEF320440F0000154626D94574AAA24022A8076F2206198FC1FB6A12243C780000002007F2981C7FF6FAC97B2778F0000000406E52C9846F232BF0E0010000800002050F000000041028780000002080600C1E00004ACF78C4B20E94A95C871D5B40A11C27A2F565AAAB71C7960AB3E8F4E9D3681900000040C040881E000000082050F00000004000818207000000820611FD7FCA72CF8C42F972FA0000000049454E44AE426082>|EssProgLan-ex2.27.png>|504px|249px|15sep|>
    </solution*>
  </exercise>

  <\exercise>
    Write an unparser that converts the abstract syntax of an lc-exp into a
    string that matches the second grammar in this section (page 52).

    <\solution*>
      \;

      See source code file in \Psection-2.5/2.28.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Where a Kleene star or plus (page 7) is used in concrete syntax, it is
    most convenient to use a list of associated subtrees when constructing an
    abstract syntax tree. For example, if the grammar for lambda-calculus
    expressions had been

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-width|6spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|6|6|1|-1|cell-height|2spc>|<cwith|6|6|1|-1|cell-vmode|exact>|<cwith|3|3|1|-1|cell-height|2spc>|<cwith|3|3|1|-1|cell-vmode|exact>|<table|<row|<\cell>
        <em|Lc-exp>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <em|Identifier>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          var-exp (var)
        </frame>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|(lambda (><math|<around*|{|i d e n t i f i e
        r|}><rsup|\<ast\>><rsup|*>><verbatim|) ><em|Lc-exp><verbatim|)>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          lambda-exp (bound-vars body)
        </frame>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|(><em|Lc-exp><space|1em><math|<around*|{|<text|<em|Lc-exp>>|}><rsup|*\<ast\>>><verbatim|)>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          app-exp (rator rands)
        </frame>
      </cell>>>>
    </wide-tabular>

    then the predicate for the <verbatim|bound-vars> field could be
    <verbatim|(list-of identifier?)>, and the predicate for the rands field
    could be <verbatim|(list-of lc-exp?)>. Write a <verbatim|define-datatype>
    and a parser for this grammar that works in this way.

    <\solution*>
      \;

      See source code file in \Psection-2.5/2.29.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    The procedure parse-expression as defined above is fragile: it does not
    detect several possible syntactic errors, such as <verbatim|(a b c)>, and
    aborts with inappropriate error messages for other expressions, such as
    <verbatim|(lambda)>. Modify it so that it is robust, accepting any s-exp
    and issuing an appropriate error message if the s-exp does not represent
    a lambda-calculus expression.

    <\solution*>
      \;

      See source code file in \Psection-2.5/2.29.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Sometimes it is useful to specify a concrete syntax as a sequence of
    symbols and integers, surrounded by parentheses. For example, one might
    define the set of <em|prefix lists> by

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-width|6spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<table|<row|<\cell>
        <em|Prefix-list>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|(><em|Prefix-exp><verbatim|)>
      </cell>>|<row|<\cell>
        <em|Prefix-exp>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <em|Int>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        -<space|1em><em|Prefix-exp><space|1em><em|Prefix-exp>
      </cell>>>>
    </wide-tabular>

    so that <verbatim|(- - 3 2 - 4 - 12 7)> is a legal prefix list. This is
    sometimes called <em|Polish prefix notation>, after its inventor, Jan
    �ukasiewicz. Write a parser to convert a prefixlist to the abstract
    syntax

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (define-datatype prefix-exp prefix-exp?

          \ \ (const-exp

          \ \ \ (num integer?))

          \ \ (diff-exp

          \ \ \ (operand1 prefix-exp?)

          \ \ \ (operand2 prefix-exp?)))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    so that the example above produces the same abstract syntax tree as the
    sequence ofconstructors

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (diff-exp

          \ (diff-exp

          \ \ (const-exp 3)

          \ \ (const-exp 2))

          \ (diff-exp

          \ \ (const-exp 4)

          \ \ (diff-exp

          \ \ \ (const-exp 12)

          \ \ \ (const-exp 7))))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    As a hint, consider writing a procedure that takes a list and produces a
    <verbatim|prefix-exp> and the list of leftover list elements.

    <\solution*>
      \;

      See source code file in \Psection-2.5/2.31.rkt\Q.
    </solution*>
  </exercise>

  <chapter|Expressions>

  <section|Specification and Implementation Strategy>

  <section|LET: A Simple Language>

  <\exercise>
    In figure 3.3, list all the places where we used the fact that
    <math|<around*|\<lfloor\>|<around*|\<lceil\>|n|\<rceil\>>|\<rfloor\>>=n>.

    <\solution*>
      \;

      Any <verbatim|const-exp> apply to other expression.
    </solution*>
  </exercise>

  <\exercise>
    Give an expressed value <math|v a l \<in\> E x p V a l> for which
    <math|<around*|\<lceil\>|<around*|\<lfloor\>|v a
    l|\<rfloor\>>|\<rceil\>>\<neq\>v a l>.

    <\solution*>
      \;

      If there is a strict type system, then no such expressed value.
      Otherwise, there exists. For example, 0 also can represent boolean
      false, other numbers represent boolean true, set initial <math|v a
      l=><verbatim|(num-val 5)><math|=<around*|\<lceil\>|5|\<rceil\>>>,
      <math|<around*|\<lfloor\>|5|\<rfloor\>>=><pair|<verbatim|expval-\<gtr\>num
      ><math|v a l>><verbatim|>=<verbatim|5>, <pair|<verbatim|bool-val
      5>>=<math|<around*|\<lceil\>|#t|\<rceil\>>\<neq\><around*|\<lceil\>|5|\<rceil\>>>.
    </solution*>
  </exercise>

  <\exercise>
    Why is subtraction a better choice than addition for our single
    arithmetic operation?

    <\solution*>
      \;

      Addition products larger result, and easily identify which values in
      current domain.
    </solution*>
  </exercise>

  <\exercise>
    Write out the derivation of figure 3.4 as a derivation tree in the style
    of the one on page 5.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Write out the derivation of figure 3.5 as a derivation tree in the style
    of the one on page 5.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Extend the language by adding a new operator <verbatim|minus> that takes
    one argument, <verbatim|n>, and returns <verbatim|-n>. For example, the
    value of <verbatim|minus(-(minus(5),9))> should be 14.

    <\solution*>
      \;

      See source code files in folder \Psection-3.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the language by adding operators for addition, multiplication, and
    integer quotient.

    <\solution*>
      \;

      See source code files in folder \Psection-3.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add a numeric equality predicate <verbatim|equal?> and numeric order
    predicates <verbatim|greater?> and <verbatim|less?> to the set of
    operations in the defined language.

    <\solution*>
      \;

      See source code files in folder \Psection-3.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add list processing operations to the language, including
    <verbatim|cons>, <verbatim|car>, <verbatim|cdr>, <verbatim|null?> and
    <verbatim|emptylist>. A list should be able to contain any expressed
    value, including another list. Give the definitions of the expressed and
    denoted values of the language, as in section 3.2.2. For example,

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let x = 4

          in cons(x,

          \ \ \ \ \ \ \ \ cons(cons(-(x,1),

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ emptylist),

          \ \ \ \ \ \ \ \ \ \ \ \ \ emptylist))
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    should return an expressed value that represents the list <verbatim|(4
    (3))>.

    <\solution*>
      \;

      See source code files in folder \Psection-3.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add an operation <verbatim|list> to the language. This operation should
    take any number of arguments, and return an expressed value containing
    the list of their values. For example,

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let x = 4

          in list(x, -(x,1), -(x,3))
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    should return an expressed value that represents the list <verbatim|(4 3
    1)>.

    <\solution*>
      \;

      See source code files in folder \Psection-3.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    In a real language, one might have many operators such as those in the
    preceding exercises. Rearrange the code in the interpreter so that it is
    easy to add new operators.

    <\solution*>
      \;

      See source code files in folder \Psection-3.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add to the defined language a facility that adds a cond expression. Use
    the grammar

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <em|Expression><space|1em>::=<space|1em><verbatim|cond><space|1em>{<em|Expression><space|1em>==\<gtr\><space|1em><em|Expression>}*<space|1em><verbatim|end>
      </cell>>>>
    </wide-tabular>

    In this expression, the expressions on the left-hand sides of the
    ==\<gtr\>'s are evaluated in order until one of them returns a true
    value. Then the value of the entire expression is the value of the
    corresponding right-hand expression. If none of the tests succeeds, the
    expression should report an error.

    <\solution*>
      \;

      See source code files in folder \Psection-3.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    Change the values of the language so that integers are the only expressed
    values. Modify <verbatim|if> so that the value 0 is treated as false and
    all other values are treated as true. Modify the predicates accordingly.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\scm-code>
            (define num-pred?

            \ \ (lambda (n)

            \ \ \ \ (if (= n 0)

            \ \ \ \ \ \ \ \ #f

            \ \ \ \ \ \ \ \ #t)))

            \;

            (define value-of

            \ \ (lambda (exp env)

            \ \ \ \ (cases expression exp

            \ \ \ \ \ \ ...

            \ \ \ \ \ \ [if-exp

            \ \ \ \ \ \ \ (exp1 exp2 exp3)

            \ \ \ \ \ \ \ (let ([val1 (value-of exp1 env)])

            \ \ \ \ \ \ \ \ \ (if (num-pred? (expval-\<gtr\>num val1))

            \ \ \ \ \ \ \ \ \ \ \ \ \ (value-of exp2 env)

            \ \ \ \ \ \ \ \ \ \ \ \ \ (value-of exp3 env)))]

            \ \ \ \ \ \ ...

            \ \ \ \ \ \ )))
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    As an alternative to the preceding exercise, add a new nonterminal
    Bool-exp of boolean expressions to the language. Change the production
    for conditional expressions to say

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <em|Expression><space|1em>::=<space|1em><verbatim|if><space|1em><em|Bool-exp><space|1em><verbatim|then><space|1em><em|Expression><space|1em><verbatim|else><space|1em><em|Expression>
      </cell>>>>
    </wide-tabular>

    Write suitable productions for Bool-exp and implement
    <verbatim|value-of-bool-exp>. Where do the predicates of exercise 3.8
    wind up in this organization?

    <\solution*>
      \;

      See source code files in folder \Psection-3.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the language by adding a new operation <verbatim|print> that takes
    one argument, prints it, and returns the integer 1. Why is this operation
    not expressible in our specification framework?

    <\solution*>
      \;

      <verbatim|print> not returns a value.

      See source code files in folder \Psection-3.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the language so that a <verbatim|let> declaration can declare an
    arbitrary number of variables, using the grammar

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <em|Expression><space|1em>::=<space|1em><verbatim|let><space|1em>{<em|Identifier><space|1em>=<space|1em><em|Expression>}*<space|1em><verbatim|in><space|1em><em|Expression>
      </cell>>>>
    </wide-tabular>

    As in Scheme's <verbatim|let>, each of the right-hand sides is evaluated
    in the current environment, and the body is evaluated with each new
    variable bound to the value of its associated right-hand side. For
    example,

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let x = 30

          in let x = -(x,1)

          \ \ \ \ \ \ \ y = -(x,2)

          \ \ \ in -(x,y)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    should evaluate to 1.

    <\solution*>
      \;

      See source code files in folder \Psection-3.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the language with a <verbatim|let\<ast\>> expression that works
    like Scheme's <verbatim|let\<ast\>>, so that

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let x = 30

          in let* x = -(x,1) y = -(x,2)

          \ \ \ in -(x,y)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    should evaluate to 2.

    <\solution*>
      \;

      See source code files in folder \Psection-3.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add an expression to the defined language:

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <em|Expression><space|1em>::=<space|1em><verbatim|unpack><space|1em>{<em|Identifier><em|>}*<space|1em>=<verbatim|><space|1em><em|Expression><space|1em><verbatim|in><space|1em><em|Expression>
      </cell>>>>
    </wide-tabular>

    so that <verbatim|unpack x y z = lst in ...> binds <verbatim|x>,
    <verbatim|y>, and <verbatim|z> to the elements of <verbatim|lst> if
    <verbatim|lst> is a list of exactly three elements, and reports an error
    otherwise. For example, the value of

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let u = 7

          in unpack x y = cons(u, (cons(3, emptylist))

          \ \ \ in -(x,y)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    should be 4.

    <\solution*>
      \;

      See source code files in folder \Psection-3.2\Q.
    </solution*>
  </exercise>

  <section|PROC: A Language with Procedures>

  <\exercise>
    In many languages, procedures must be created and named at the same time.
    Modify the language of this section to have this property by replacing
    the <verbatim|proc> expression with a <verbatim|letproc> expression.

    <\solution*>
      \;

      Same as <verbatim|let name = proc (var, <text-dots>) body>, except not
      including keyword <verbatim|proc> and <verbatim|=> symbol, for example,

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\verbatim-code>
            letproce name(var, ...) proc-body

            in let-body
          </verbatim-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    In PROC, procedures have only one argument, but one can get the effect of
    multiple argument procedures by using procedures that return other
    procedures. For example, one might write code like

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let f = proc (x) proc (y) ...

          in ((f 3) 4)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    This trick is called <em|Currying>, and the procedure is said to be
    <em|Curried>. Write a Curried procedure that takes two arguments and
    returns their sum. You can write <math|x + y> in our language by writing
    <math|-(x,-(0, y))>.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\verbatim-code>
            let f = proc (x) proc (y) -(x,-(0,y))

            in ((f 3) 4)
          </verbatim-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Extend the language of this section to include procedures with multiple
    arguments and calls with multiple operands, as suggested by the grammar

    <\wide-tabular>
      <tformat|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|1|1|cell-halign|r>|<table|<row|<\cell>
        <em|Expression><space|1em>::=
      </cell>|<\cell>
        <verbatim|proc><space|1em><verbatim|(>{<em|Identifier><em|>}<verbatim|)>*<math|<rsup|<around*|(|,|)>>><space|1em><em|Expression>
      </cell>>|<row|<\cell>
        <em|Expression><space|1em>::=
      </cell>|<\cell>
        <verbatim|(><em|Expression><space|1em>{<em|Expression>}*<verbatim|)>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      See source code files in folder \Psection-3.3\Q.
    </solution*>
  </exercise>

  <\exercise>
    The concrete syntax of this section uses different syntax for a built-in
    operation, such as difference, from a procedure call. Modify the concrete
    syntax so that the user of this language need not know which operations
    are built-in and which are defined procedures. This exercise may range
    from very easy to hard, depending on the parsing technology being used.

    <\solution*>
      \;

      We can define procedures, just need to ensure that all basic functions
      are built-in before doing this, so we can write any procedure into
      inital environment.

      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<twith|table-bsep|0>|<twith|table-tsep|0>|<table|<row|<\cell>
          <em|Procedure><space|1em>::=<space|1em><verbatim|+(><em|Number,
          Number><verbatim|)>
        </cell>>|<row|<\cell>
          <em|Procedure><space|1em>::=<space|1em><verbatim|-(><em|Number,
          Number><verbatim|)>
        </cell>>|<row|<\cell>
          <math|\<vdots\>>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    What is the value of the following PROC program?

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let makemult = proc (maker)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ proc (x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if zero?(x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 0

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else -(((maker maker) -(x,1)),
          -4)

          in let times4 = proc (x) ((makemult makemult) x)

          \ \ \ in (times4 3)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    Use the tricks of this program to write a procedure for factorial in
    PROC. As a hint, remember that you can use Currying (exercise 3.20) to
    define a two-argument procedure <verbatim|times>.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\verbatim-code>
            let f1 = proc (maker)

            \ \ \ \ \ \ \ \ \ \ proc (a)

            \ \ \ \ \ \ \ \ \ \ \ proc (b)

            \ \ \ \ \ \ \ \ \ \ \ \ if zero?(a)

            \ \ \ \ \ \ \ \ \ \ \ \ then 0

            \ \ \ \ \ \ \ \ \ \ \ \ else -((((maker maker) -(a,1)) b),
            -(0,b))

            in let f2 = proc (maker)

            \ \ \ \ \ \ \ \ \ \ \ \ \ proc (n)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ if zero?(n)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 1

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ else (((f1 f1) n)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ((maker maker) -(n,1)))

            \ \ \ in let f3 = (f2 f2)

            \ \ \ \ \ \ in (f3 7)
          </verbatim-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Use the tricks of the program above to write the pair of mutually
    recursive procedures, <verbatim|odd> and <verbatim|even>, as in exercise
    3.32.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\verbatim-code>
            let* even = proc (maker)

            \ \ \ \ \ \ \ \ \ \ \ \ \ proc (n)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ if zero?(n)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 1

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ else ((odd maker) -(n,1))

            \ \ \ \ \ odd \ = proc (maker)

            \ \ \ \ \ \ \ \ \ \ \ \ \ proc (n)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ if zero?(n)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 0

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ else ((even maker) -(n,1))

            in let even? = (even odd)

            \ \ \ \ \ \ \ odd? \ = (odd even)

            \ \ \ in (even? 7)
          </verbatim-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    The tricks of the previous exercises can be generalized to show that we
    can define any recursive procedure in PROC. Consider the following bit of
    code:

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let makerec = proc (f)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ let d = proc (x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ proc (z) ((f (x x))
          z)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ in proc (n) ((f (d d)) n)

          in let maketimes4 = proc (f)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ proc (x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if zero?(x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 0

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else -((f -(x,1)), -4)

          \ \ \ in let times4 = (makerec maketimes4)

          \ \ \ \ \ \ in (times4 3)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    Show that it returns 12.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\verbatim-code>
            (times4 3)

            ((makerec maketimes4) 3)

            ((maketimes4 (d d)) 3)

            ((maketimes4 \|proc (z) ((maketimes4 (d d)) z)\|) 3)

            (\|proc (x) ... else -((\|proc (z) ((maketimes4 (d d)) z)\|
            -(x,1)), -4)\|

            \ \ 3)

            if zero?(3) ... else -(((maketimes4 (d d)) 2), -4)

            -(((maketimes4 (d d)) 2), -4)

            -(((maketimes4 \|proc (z) ((maketimes4 (d d)) z)\|) 2), -4)

            -((\|proc (x) ... else -((\|proc (z) ((maketimes4 (d d) z)\|
            -(x,1)), -4)\|

            \ \ 2),-4)

            -(if zero?(2) ... else -(((maketimes4 (d d) 1), -4), -4)

            -(-(((maketimes4 (d d)) 1), -4), -4)

            ...

            -(-(-(((maketimes4 (d d)) 0), -4), -4), -4)

            -(-(-(0, -4), -4), -4)

            12
          </verbatim-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    In our data-structure representation of procedures, we have kept the
    entire environment in the closure. But of course all we need are the
    bindings for the free variables. Modify the representation of procedures
    to retain only the free variables.

    <\solution*>
      \;

      See source code files in folder \Psection-3.3\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add a new kind of procedure called a <verbatim|traceproc> to the
    language. A <verbatim|traceproc> works exactly like a <verbatim|proc>,
    except that it prints a trace message on entry and on exit.

    <\solution*>
      \;

      See source code files in folder \Psection-3.3\Q.
    </solution*>
  </exercise>

  <\exercise>
    <em|Dynamic binding> (<em|or dynamic scoping>) is an alternative design
    for procedures, in which the procedure body is evaluated in an
    environment obtained by extending the environment at the point of call.
    For example in

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let a = 3

          in let p = proc (x) -(x,a)

          \ \ \ \ \ \ \ a = 5

          \ \ \ in -(a, (p 2))
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    the <verbatim|a> in the procedure body would be bound to <verbatim|5>,
    not <verbatim|3>. Modify the language to use dynamic binding. Do this
    twice, once using a procedural representation for procedures, and once
    using a data-structure representation.

    <\solution*>
      \;

      Just change the code in <verbatim|func> constructor, remove
      environment. In <verbatim|apply-func>, use the current environment.

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\scm-code>
            (define-datatype function function?

            \ \ (func

            \ \ \ [vars (list-of identifier?)]

            \ \ \ [body expression?]))

            \;

            (define apply-func

            \ \ (lambda (f args env)

            \ \ \ \ (cases function f

            \ \ \ \ \ \ [func

            \ \ \ \ \ \ \ (vars body)

            \ \ \ \ \ \ \ (value-of body (extend-env* vars args env))])))
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Unfortunately, programs that use dynamic binding may be exceptionally
    difficult to understand. For example, under lexical binding, consistently
    renaming the bound variables of a procedure can never change the behavior
    of a program: we can even remove all variables and replace them by their
    lexical addresses, as in section 3.6. But under dynamic binding, this
    transformation is unsafe.

    For example, under dynamic binding, the procedure <verbatim|proc (z) a>
    returns the value of the variable <verbatim|a> in its caller's
    environment. Thus, the program

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let a = 3

          in let p = proc (z) a

          \ \ \ in let f = proc (x) (p 0)

          \ \ \ \ \ \ in let a = 5

          \ \ \ \ \ \ \ \ \ in (f 2)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    returns <verbatim|5>, since <verbatim|a>'s value at the call site is 5.
    What if <verbatim|f>'s formal parameter were <verbatim|a>?

    <\solution*>
      \;

      2
    </solution*>
  </exercise>

  <section|LETREC: A Language with Recursive Procedures>

  <\exercise>
    What is the purpose of the call to <verbatim|proc-val> on the
    next-to-last line of <verbatim|apply-env>?

    <\solution*>
      \;

      We can't directly set a cycle link between in envrionment and proc-val,
      only make a proc-val whlie calling <verbatim|apply-env>.
    </solution*>
  </exercise>

  <\exercise>
    Extend the language above to allow the declaration of a recursive
    procedure of possibly many arguments, as in exercise 3.21.

    <\solution*>
      \;

      See source code files in folder \Psection-3.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the language above to allow the declaration of any number of
    mututally recursive unary procedures, for example:

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          letrec even(x) = if zero?(x) then 1 else (odd -(x,1))

          \ \ \ \ \ \ \ odd(x) = if zero?(x) then 0 else (even -(x,1))

          in (odd 13)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      See source code files in folder \Psection-3.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the language above to allow the declaration of any number of
    mutually recursive procedures, each of possibly many arguments, as in
    exercise 3.21.

    <\solution*>
      \;

      See source code files in folder \Psection-3.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Implement extend-env-rec in the procedural representationof environments
    from section 2.2.3.

    <\solution*>
      \;

      See source code file in \Psection-3.4/3.34.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    The representations we have seen so far are inefficient, because they
    build a new closure every time the procedure is retrieved. But the
    closure is the same every time. We can build the closures only once, by
    putting the value in a vector of length 1 and building an explicit
    circular structure, like

    <image|<tuple|<#89504E470D0A1A0A0000000D49484452000001F7000000A508060000004144B46F000000097048597300000B1200000B1201D2DD7EFC00001A8349444154789CEDDD3D6823DD7EC7F1A31048738BF5728B14091934B7CF06B9CF60644813D81432D818B295DD6E67974F6957D9D62A8203C606ABD924A5855191724536A91F89B99040AAD55E48195038DADFF11ECF8BDE2C4BA399EF078CED39A333AF3AFF392F33531B8FC706000094C71F712C01002817823B00002543700700A06408EE0000940CC11D008092C90CEE61107C0A83E04D2A010000145E667037C67C32C67C4C4D050000DB19DC07711C1B63DE507B070060FB640677F96C8CF9909A0A00000A2D37B80FE2B8678C79974A000000DB19DCE53A0C026AEF00006C91A9C15DB5F728950000000A6B6A70971EB5770000B6C7CCE03E88E36B6AEF00006C8F799F50676BEF04780000B6C05CC15DB5779AE60100D8028B3C5BFE2BB57700008A6F91E06E6BEFEF5353010040A1CC1DDC0771FCDD18F33D0C8220950800000A63D157BEF2421900000A6EA1E0AEDABBA1F60E0040712D5A7337D4DE010028B68583BB5E076B781D2C0000C5B44CCDDD507B0700A0B8960AEEAABDBFA1F60E0040F12C5B73B73EF3D43A00008A67E9E0AED7C1BEB3B5F73008AE53330000808D583AB87B8FA2FD4F630CB7C6010050102F6996B701FDEF8D317F9E4A0100001BF3926679DB14FF57C6983FA4120100C0C6D4C6E3F18B961D06C13B63CC3F1A63FE25958865D97DFA75857BAFE8F9D98BC55F521301004B797170373F02BC1D5C47E1BC3AFF6A8CF9DB0AE5F76910C7EF525301004BF9E355ED368D9EC70A8441F07FABDC9F5B90DFF7D44400C0D25E32A00E00001410C11D00809221B8030512457BE328DA3BE39800788995F5B96FABC3A3E3A631E6C118B37F777BD3ADFAFE00006CBFC2D7DC0F8F8E1F0E8F8EAF520900002053E56BEE405214EDD9D61C7B415937C6F48D3107BDDEE3308AF62E8C3127C6981D634C57D34751B4F7C51833ECF51E0FCC8FCFDBF48131E6D218D3565E4D2DA6DDEB3D9E6BBEBA9736D2BC5345D19E5DFE99B76EA7BDDE635F4DF92DADD789F238EFF51EDB4AB3EBFED6AEAF967D6FF3E8F51E77A72D0FC0765A4B703F3C3ABE5081640D6D81649BC00F8F8E5DA1B3AFFF5B2AEC7655E05D79793C155877B737978747C7B600BDF70ACD49217C777B33544DBF9928E86C5A4779B9E5BACFCDBB1D0DAD5343933A77B737074A1B28AFBAD247DA8E910AFA536FF976DDBFD115B01961107CD4837DAE736EE9BBD2B9638F57C306764DB7C7F2C09BE74AFFDBF92E6C5057F06CE902A0AD73D4DAD7B4FB28DA330AF00F4A3B50DE53FBDAA368AFA5F3F640DF233BFF4314ED859AA5A1E9075A87AB28DAEBBBF5D3B4B62E3EECDFE7A985002885570FEE0ACAB62009BDC06B0B9A5D05691B0CEF0F8F8E0F5458DA203854C1D8B6CDF2B6C0BABBBD394D643D09CE77B73735F333B89E780556DDA52B0F5B1076D4C77EA1E5B4B53E8DE47AE7B00575FBEEF66657EB3DB017242E686B3B4F55984ED6E7EEF6E6FCF0E8B8A37573F39D689B5E14D8C32008F46EFD95788DFCE67CA9D01BEF4544EBF0AB31E61FECBB11C220F80F3D44C77FB3E18ECE1F5B1B7F3A46BDDEA3AD89BB9A7957C7DB2483A77E77944753817DA41F3BBDA5A06BD3776DCD5BF9F675D167FF6E683DDCB2BBEE1C5600375AD689B71E4635F991F2B2694DBBDE51B4D7F5D6AFE97D1E4009ADA3E6DE52216603612AD1066DD5886D00BEF402E52C931AF9E1D1B1FF883D3F488FBC0B82A157A03595E60AB68E57BB771709F5C4B2434DB33F176A8970FC793B2EDFC3A3E39157385F6AFB9B0AE8672BAA357D58F19301579D5F51FDC65BAFAC07E8ECEB427310457B1DAFB9BDA563F7EC62504DF65D05ED8E17D0DD7C0FA925E8BC71815D7FDBA0ECFEBDF0CE59ABA6FC1AFEF92AFE45C028232FE35A11D41530B9F870F302289F75F5B9F76D6D3735F56713B52B9C924175167B31901724F30AAE9D2969F662234C4DFCB19E6EDD0EA65C8064E6AB168B491781CBC7BBB8282DB502CC6C09B04FA8CB691E7F156110D88B987FB21732592D150AB8BBEA7B7F503FF7502D37075E778F7F91E79AE04F5C8D5F9F9F6CA2D7B43FA13C27FDEE2E4D2D026E1DF633B6DD9E5F97AE052191DFD426FD5EEFB113457B23AFA69F953F809258C768795B1036D4CF3D61FF565037AA210D55D8B4FCF9FCCFA7725501AB66F6A77C5373A5D965D56D6B81D6E1223547B6BEEB177501DAFEF6C602CC72A942F54C7F63436C13FC208E3F640576A340A9C0ECCED151E21C4CD59E6DF0D47C17AEFB454DE97DD5989BFA69A9C9DDCDFF94E6F5CFE7B1E7CD995B3FFDCC7BFE192DF32CD9DD00A07C5E3DB8DB7E753541DBE6ECB19AD1277D840AC60DD586BBDE7C7E73A46BE61EEBC70DB27335A8072FDF99357FAD8FFDDC17F56FCE35A0EEEEF666E4D576065ADE2035630E6DDFD01B68850252EDD93DFBE04A23CE3B3A661D05E02B17C0FDDAB637A6C23FBEFB3AEE0FFAB9D028757FC0E583F2ED4E3B1F5563BFD48585FB4C2B35633EB75E9C7F40C9ADECAD7083385EE780A8520B83603488E39D59DB1806C12FF3BC2A7553F9CD8BF30700568BC7CF02005032047700004A86E00E0040C910DC01002899950DA8B38379530958D6BCB7CB4573EEF74DE5372F7B5BDA3C4FB20300CC61550FB1B1CFEA7E939ABA19F6E963FFBBE507FFBFF488D459823983F1A6F29B17178600B0422BA9B9174918049FF5E4B1AF653F51E6BD756D53F9010036A38C7DEE93B77DA5A602005011650CEE7F618CF9CB30083EA5520000A880520577EFB5A1FF6D079B8541F03E3513000025B7AEB7C2AD8B1DD4F77736B00FE2F823272F00A08A4A55731FC4F167FB63DFD11D06415146EF0300B05665ABB93B3DDD03FE39955202611004BA0DCEFE6D0710BE59E7FBD00100C556CA27D429D095F92D63DF75E1625F91FBEFA9540040A595F9F1B3DF53534A6210C72EB8FF8931E6F7D4DA0100BE3207F7B2F7B9BB5BFD78E80C00E0993207F79E776B5CE9E8097CFF5CD671050080E59575409DD1A0BA8F657E6EF9208EB98F1F009052DA9ABBFAA579D31800A072CAFE3EF7D20EAA0300204FD983FB57DD075E2AB55AEDA156AB0DCC8FBFEBB55A6D5CABD54ECAB69D0080E5943DB897F57EF70363CC4EAD56BB30C6DC1B63DAE3F1B89D9A0B005049A50EEE83388ECBD8EF3E1E8F470AF06736C8EB613600004C94BDE65E663BDAB69D6A6E3E00204F15827BAC67B19786ED675773FCA93166A8BF010098A84270B70F7B29DBA03A1BCCBBEA67B7CDF34D06D401009CD207F732BE44663C1EEF8EC7E37DFD3D1C8FC73506D401001CFADC01002899AA04F7EF611094FD453200004C5425B897B1DF1D28AC28DAFB12457B17F3ACDF22F3BE4414ED9D45D1DEB84C678DDD1EBB5DA904545E55827B591F66831288A2BD5614ED0D8ABE2551B4F7B04020E9EB4E8E55CFFB5AEB0B944A99DF0AF7C4BE4486667914585D3F45D7B47769CCB38EBDDEE3696A628E45E65DD0DCEB0B944D25823BB02AAA09DA26E4B7BDDEA37D52A09D666F4DACF77A8FBB51B4B7A35B159BAA8D9EF67A8F5DCDB7A3CFB6F4F0219BDED634A326E36EAFF7B8AF79AF34AFD5B14F22ECF51E875A87A66AC7F6EFD04E779B98B59C5EEF31545A4B69752DFFB2D77B6C7BCBBF54DE0D05C603BB9D5E73F6859AD0EDDD1A23AD63437F9F27F2B2FF5F6A7D5BCACFDDB2B9ECBC752DD3ED5FBB5FCE7ABDC79A7F8873D6D7A59D69BF3DCB3B23AD9377E191359FD6ED8BF6E9A58EC3171DD3D38CFD3BD4FEEDDBAE091DA703EF180E347F376F3F0379AA345ABE942F91C1DA75B4C049D05521DCF2A63FA8000E35ED5EF3B8B4A61E3EB4AFC7067714E08D37CDCD5BD7B47DFDFDE06D6CD3E5E507F629CB7181FD5ECBDBD7EFAB28DAF39F9170A28072A065BA0724B9E0E83EDBD7FF9D445E8D9C03D2507E07FACCB2F33EE882C56D57DEF31DF2D6D7E59FCA5BFBE14C69F633ADACB10079F3E9389CEB82A2E12EDA128F873EF1D6C9CEFFA0F3A3A37CDCB9E22ECCDCB931EF7E0626AA5473B7FDEEEF35B80E58EE24FA5173EEAAF06D2B885A6D15B80DAF30EF2808D8427BA8B45D5B53F3F3549AF16AF8ADE4BC51B46703F517A53907C9C01E457BCDBCE5685D6C2DF352FF77B5CE675E1069F77A8F1DE5E5D226EB16457B46B54BD7D4DD774153DBE0B7286439552B405F416EA17915F8EA89FDD2F06AD0FE714AADAFFECFCC5BEBE102AFDBA71D1DE7E4BB1B72E7B3356AEF226A7271E65A78BCFDEB5A2186AA9DBB8BC30BEFBC6AE9588D96D8CF40756AEE657D890C36A2AD60534F14C27EED72A02659A31AD8242D23E066A927E7F5FEAE7BD3B206A14D5B4E232320F413FDFDA39CBF536CB0B55D1251B4F74DDB3B950B728960972967DEAC6D9B9957524EDE2EFF336DCB40413C6B2CC4ACF92EF57FDFBB104AADAF77FC76F477D7ABBD37DD05D7A2FB19303CC406589C6AB62315EA2DAFD6EB0A6BDB1F5FF37E2E5DA13E6773EA3039AFF7775640F74D5BCED0BB00719A2F18A9EE9AC877937DDEAFC46D9B1F4857F9E224D79FED1FBBACED9A35DF85027523D1D2F26C7D338EA96B093A49B490AC7B3FA304AA36A06EF21219D5E221F64E027B4741DEFFC8E49ADC9F0A6135050FD5CFEE9ABE6DADACA3E6DA33A59D2B40EC78170AAE39DED6F63ACAE74AF31A0DA87269A9666867C6722E95E7996AECAEDFFE209551B6915A2C5C8DB4EE6AFE897EFBD7E2829D5D7F37806DDA7293EB3B8B0DAEF65EF89117704719AD20B9F3A98FBEAE311717DADF7DAF967EA2EE809177FE7474FE7494E7858E95B3EEFD8C12A85ACD9DFBDDB3056110D80B9EBF0983E0ABC62660BAA73EEAC45C6E20D7837E4E1269EE2D7E0FFE686B05AE7B6FFEA701579ADEF7477CCF90B91CF5F59E6A190F6A753870C1650EE7AAF9BB4160A7DE403F37FAFFD55E41AC0079A0A6EBB1BA3DA6B53A24D777AA5EEFF1DCBB7BE1411754A966F9BCF9BCFEFF5335F99F7B7714387DEF7326E398BA63E19F576BDDCF2807FBC2914A1DCA3008AE0771FC219550716110D80B9FBF36C6FCC1067B6AEE282A05EA8617289BEE56BF22F36F0FE4E4C26BAB629F3B412BDBB5A67E26B0A3A8D42CEDEE506825C63C00904A06779E56973688631BDC7F6F8CF925950814877B888DEB6EB8A4260CA455B159DEF6B9DB01639F53892FCBF753095E4EF386960D00D83AD7AAA03DA9E2E367ED80B18FB6F93995F232EF0671CC603D00C0DAA8C29A8A3D956B96577F32CDF20080D2E2C531AF44CFB1E7220200B06AF1ACE7B55435B8F76C53C6208E7BA994D5F9A4FBEA01005815FB18F578D6E0E7AA0677F7A096570DBE83389EBAF3010058445E1F7B52259F2DCF4B64000065469F3BD64EE3113EB1E757E637FAF99F1565B8EAFC80B2FB9D31E6D7D7DCC645EFC6AA7270E725329B63071AF6E8B6588D3008ECAD9DEF57752BE6AAF303CA2E0C82D16B7E5FF478F08554F995AFBC440600504A950DEE8338FE5A8227CA01009052E59ABBE13E74004019557D409DED777FC35BD0967378746C5FE231F03EDCBDBBBD99F79DE3A5707874DCD44B4CF6EF6E6FBA55DAF6B23B3C3A9EBCA2F5EEF666232FA6393C3AB6DFADF64B97CF395A4D550FEEAEDF7DD5CF99AF84BBDB9BA17DF990F951803C547D7F00C8A78BA5D3BBDB1B5ED1BB06956E96D713EA185407002895AAD7DCCD265E71AAE6365BEBDD31C634F4F7C1DDED4DDF4BEF2BBDA98F85B6A67C78747CA1F7585B23351BB6CDCF66F22BEF3346F976522BF1735D76D4B47EEAE6D3B46FAE194FB57297E750D387A9CC5EC1E1D1B1DB9EA1B70EA7DE36BBF48EB75F26E98747C727C6980BED47EBF2EEF6E6DCDB76FBD9136FAD9FD213FB79A83CBB4A3B53BE46C7C9E557F7F665DBFBDFED47F7FFA5D67972ECEF6E6FC259CB7C091DBFBA3B6E5A4EF3EEF66677D5474C4DC0176A4E6E27D2EA4A1B69BFD9FDDFF68E81FDCCA9E63D51FAB9F6C98E4B3F3C3A6E28ADA1CF75759E8FBCE373E61DF7BEDBD68C73E2A9D95DEB7EAFB47E62DD07EA763A35194DE633BEB3B9CB9C43FDF0E8F84BB29CD077F4DE5B565FE78B2B43F2CE51BBDFEA7EF799CE8FEEAC754AEC9FE4BE4BAE8FF1BE07FEF7EC4AFF9B4D751378CB3F77E78C9766D7B3A5B47EEAC35BA4EA03EACC0607D5357402D554D85D24D25BFAC2D5DC04AFD0DAD7F4B6BE2C75CDE20AF15DA587CA3B974EEE4E22C89D28E8B82FDE643D94E7D00B40EB52F7F6852D4C2E54983836BDA17417809B0A00979A7E60D75B5F5E3FB09F7ADBE68283FB82875E9E17E679F03A55DA3205C08982965FC0E62E73050EB46DF78747C72D2DFF6095C7CEEE170521BB5F3B7E60B7E7E7E1D1F1BD2E6C862E404ADD3B3E27DABF3EBBBEBBDA5F2E88D8F37CE49DE30DEFF8B840DAF18EABBB687517BF079A7EEACE252F3875BCEFD6A2B2BEB3B9CB9C33EFA63EF356FFBB73E25EE77DE82DEFDECC3E472717966E3FEB776381ED7565CFBEB6C3953D2DADEB5BA5BF555961CB98536F1D9FBE6F1BECFF7717F8DFEC79E96D83D179DBD577E54BC6F9B835A8B9AFE72532593ADEC9DDC928C83BEEAAD87D3174A275BDCF5D2AD0B60E8F8E3BFAB23F5DBDAB763D34D9B554E3D5806D3E039BBFF23EF3BE00C6FCEC2F73D6FDA51C7AB50AB77E0D6F3D46AE26E27EEB42C878FBB0737874DC5701D476BFFD20E42DA3A57D69F749725D9A5A9EFB5CF2C2681E97DE310CE758E68BD80BB8C3A3631B3CBF28001CACAAE545C1D4AF79FB41DD05DD86B639EB826212E8757C4CE2B81A9DA3439DA3EE3BB0E3FE57CDD8D5FE4FBDD690A70B88C471B51E12FBB8A13C775C90F36A9C8BC8FACE9E4D59665735FE7A6219A1777CDA5E6DDC3FD79AAA1CB8F92E15901AD3CE51ED2FD7CAD5D5F4B6D7EA316D7D46AA4C34BCB4BACA98AE7E0F947FA7A883F7B4ADF6FC38552B960DE25D9DA37D1DC34BD7FAA1E3966A897A8975C41C82FB8F41751F37FC06B79D8C1AF6D41AF7149935021576A7A9849F5FF8AE6A4E75F3F30A36D95AD075CD7AA94CD6C76D9FBF7F56BAAFA49FD36C9D75ACF2E4E59FF7F9BC65AEC28EB73EAB3C7ED3F29ABBD633A5269BB7AFA6C9CBCB799BD31CBBC8F2B29631EDB3A9659A1FDFB3303567BE79CFBD59F3B575B1F1D45A34E7FA3CE81CAD25EF9451F00F75F1D552FECFBAC1B640734A4BDCB4F37C21F6C9A87AC6CAABC69CCA37CBEB36B84D34CD37D45C59D79721B75FDCD3F59BD4BCE6F18E574B3F7157D66A6E9CB75679A9F53873B52279EAB7D4BA36720AB6D7B4E36DB3EB32C8FB123A7EDFA35173B45F2BECAAC5E369FF78B5ACAE8ECF999FA60034543F6843FFFB2D2EAE40DDF19A63E7356D992FE235399FEBE72251FB5A9A2DBC754172AE736FE0B79AA8256557DB36564DC9E76AD3EE38CCFA1EF4B59FDD71ADEBB31D2F7DC7AF75DB63AC7DE0CE997B2FADA97DE1D25AE679BFAC7F6CEBE6671FF5BCC765DA32E7D14A9413FEF97BE235299F79DF8B69E7A8518DBAEBC63CCCD38AA37C76BCE5BBE3B6637EEEE3139BB72A125D6F4C84D35D26486AFBC76A5548D13937F69BD7BDCF5E29CDFF9EEFB8E95E37E681377EE04CCB727DEFBB2BBE48F9B88E3BB42A1FDC376CA09F51B2193C8B6B2ED255F1D8EB33765FCE7D7DB1BF28FD5B463699F4851FFA4D93D2D6F46FEECA5D05F5BA6F7DF3BF8C59CDBBCF687B4ED5CF3E56E17AE95A245400B9310B632F6FB79F5D1074692D2FADAB26EE6FFE95BE6A666D15A683392FD8DC677397B902F7AA715D6A391D35E1A60AC365A950DFD53E7F76D164CF4F35C9870A3A7EE06C695B2F12E77226EDE37D05F0B1F673DF7D7F747CCF5DBEDEF7C43F27EA5EDA95D2FAFEFECF58765B17D6637D1FA6AEA7B7EDB9CB9CD350E7DAB3EDD477C035838FBD6953CFD1C4F698C4857C2EED777FFFB80BA27BEFC2DB3F777732CA347701384E06DC3573173B6F15D49F8EA5D6A9A9AEABDDD7EA5A58C73B4D6AE371D6795C2D61107CB0EF78D7236997621FECEFBF3820F9BF2F39F2B682FB7BF23EE2795E1CE346C3CF682EACB46D7C718C371A3E5CD79D1778B6FFBFE882AF9265D0AAE9C531335B73F446CC778338BE4E254EE1C79364F999579ED2E7FEC357DDEFBE74700780A2F306D6F6336AD6787DB622B996B76112DCF51219D5DED7825AE8FCA85994939ACF7952D99A4D1B588BF558D7E3CEE9730700E0958541F07E9DADC304F79F62DDA20000C0AA458BF6B5BF04C1FD27DEEF0E002805FADCC53E2D280C824FBC216E6D3E6894275EEECF8C31BFB5236A57B42F579D1F5076BF99F17DF9ADD1A8F754CA7C16AE7812DCB1767AEC225D20002A210C82EB411CAF6DD0B6A1593E65ED6F880300945718041B793919C1FDB9AF3415030056C88E92FFB4EE1D4AB3FC73AB7C89CC57FA2C01A0F27E678CF9355CEDCD583347DD13DC3DF6E102AB6A4219C4F1C7D444004065289EFCB2897840B37CDA46FA470000A5F3619E5AF66BA0E69E666F897BB7CC4B64C22058CB338301005BC1F6B7BFD1D3E95E8B6DEF4FBD658EE09ED6D3015934B87FA4D60F00903F35C6FCDB8AC670CD920AEEBCF235C326EE49040094875E9DFC791DEF6ECF429F7B36EE770700BCC4BB4D05764370CFC54B6400004BB1E3B6D6F906B82C04F76CB68F8487D9000096B1B151F20EC13D8346CAF3863800C052EC735336B9E708EE0000AC48119AE40DC17DAA953DAD0E0050191F8BF0EA70827BBECFBADF1D0080797DDF7493BC21B8E7A3DF1D00B08830083E14A1D66E08EEB3D1340F0098D3FB411C17E26DA004F7E9AE754B030000B9C220888A526B3704F7E9689A0700CCE9E3208E377A6FBB8FE03E5B4FFD280000A428461426B01B82FB6CBA1223B8030052342E2B1AC471619AE40DC17D6E9FA8BD030032FCA29F4221B8CF4157641123E701008E06D17DDFE4DBDFF210DCE7F7A98857670080F55365CF0EA22B645C20B8CF4923E7BFEB4A0D00506D9FF4A8D942AA8DC7E3AA1FA0858441609BE83F14E1F1820080F50B83C0D6D67B4579604D166AEE8BFBA82B360040C56870755CE4C06E08EE8BD3C089EB300808F00050210AEC51911E56938766F925B95BE3B6E12003005EC60BEC5B715B3435F725B9A0CEFDEF00506EDB16D80DC1FD6508F000506E6110D871566FB629B01B9AE55743C1FDDD208E0B7B5B0400607EBA8FDD8D8A2FD4A365E741705F11DDFFFE410F35E0363900D8526110BC737746E919275B87E0BE42611004BA4DEE53D16F930000A4E91EF649AD7D9B2B6A04F7575096930300AAC26B7DBD2E43E58CE0FE4ABC5AFC676E97038062F2CA6ADBB75E9AE79710DC5F99AE063F12E401A038BC9A7AACAED452B5B212DCD7C43B91BE2AD017EE15810050661A013FB9BB4935F5D256B808EE6BA6262077CBDC579D60047A0078052A73DF1B6302E57EBDAD23E0174170DF20DD6E1179275DAC801F13F00160312A536D79FA4E839A8DCAD5CAB59612DC0B445798C913D3FE66C43D0064F3CBC8D85592AA7EA712C11D008092E1D9F20000940CC11D00809221B803005032047700004A86E00E0040991863FE1F9F4975F7412DFE220000000049454E44AE426082>|EssProgLan-ex3.35.png>|503px|165px|25sep|>

    Here's the code to build this data structure.

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (define extend-env-rec

          \ \ (lambda (p-name b-var body saved-env)

          \ \ \ \ (let ((vec (make-vector 1)))

          \ \ \ \ \ \ (let ((new-env (extend-env p-name vec saved-env)))

          \ \ \ \ \ \ \ \ (vector-set! vec 0

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (proc-val (procedure
          b-var body new-env)))

          \ \ \ \ \ \ \ \ new-env))))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    Complete the implementation of this representation by modifying the
    definitions of the environment data type and <verbatim|apply-env>
    accordingly. Be sure that <verbatim|apply-env> always returns an
    expressed value.

    <\solution*>
      \;

      See source code files in folder \Psection-3.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend this implementation to handle the language from exercise 3.32.

    <\solution*>
      \;

      See source code files in folder \Psection-3.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    With dynamic binding (exercise 3.28), recursive procedures may be bound
    by <verbatim|let>; no special mechanism is necessary for recursion. This
    is of historical interest; in the early years of programming language
    design other approaches to recursion, such as those discussed in section
    3.4, were not widely understood. To demonstrate recursion via dynamic
    binding, test the program

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let fact = proc (n) add1(n)

          in let fact = proc (n)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if zero?(n)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 1

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else *(n, (fact -(n,1)))

          \ \ \ in (fact 5)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    using both lexical and dynamic binding. Write the mutually recursive
    procedures <verbatim|even> and <verbatim|odd> as in section 3.4 in the
    defined language with dynamic binding.

    <\solution*>
      \;

      Too lazy to write code.

      Lexical binding returns 120. Dynamic binding returns 25.
    </solution*>
  </exercise>

  <section|Scoping and Binding of Variables>

  <section|Eliminating Variable Names>

  <section|Implementing Lexical Addressing>

  <\exercise>
    Extend the lexical address translator and interpreter to handle
    <verbatim|cond> from exercise 3.12.

    <\solution*>
      \;

      See source code files in folder \Psection-3.7\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the lexical address translator and interpreter to handle
    <verbatim|pack> and <verbatim|unpack> from exercise 3.18.

    <\solution*>
      \;

      This need adding a new expressed list value for unpacking multi values.
      Too lazy to do.
    </solution*>
  </exercise>

  <\exercise>
    Extend the lexical address translator and interpreter to handle
    <verbatim|letrec>. Do this by modifying the context argument to
    <verbatim|translation-of> so that it keeps track of not only the name of
    each bound variable, but also whether it was bound by <verbatim|letrec>
    or not. For a reference to a variable that was bound by a
    <verbatim|letrec>, generate a new kind of reference, called a
    <verbatim|nameless-letrec-var-exp>. You can then continue to use the
    nameless environment representation above, and the interpreter can do the
    right thing with a <verbatim|nameless-letrec-var-exp>.

    <\solution*>
      \;

      I don't think that need add a <verbatim|nameless-letrec-var-exp>.
    </solution*>
  </exercise>

  <\exercise>
    Modify the lexical address translator and interpreter to handle
    <verbatim|let> expressions, procedures, and procedure calls with multiple
    arguments, as in exercise 3.21. Do this using a nameless version of the
    ribcage representation of environments (exercise 2.11). For this
    representation, the lexical address will consist of two nonnegative
    integers: the lexical depth, to indicate the number of contours crossed,
    as before; and a position, to indicate the position of the variable in
    the declaration.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Modify the lexical address translator and interpreter to use the trimmed
    representation of procedures from exercise 3.26. For this, you will need
    to translate the body of the procedure not <verbatim|(extend-senv var
    senv)>, but in a new static environment that tells exactly where each
    variable will be kept in the trimmed representation.

    <\solution*>
      \;

      See source code files in folder \Psection-3.7\Q, main in file
      \Psection-3.7/trim-func.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    The translator can do more than just keep track of the names of
    variables. For example, consider the program

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let x = 3

          in let f = proc (y) -(y,x)

          \ \ \ in (f 13)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    Here we can tell statically that at the procedure call, <verbatim|f> will
    be bound to a procedure whose body is <verbatim|-(y,x)>, where
    <verbatim|x> has the same value that it had at the procedure creation
    site. Therefore we could avoid looking up <verbatim|f> in the environment
    entirely. Extend the translator to keep track of \Pknown procedures\Q and
    generate code that avoids an environment lookup at the call of such a
    procedure.

    <\solution*>
      \;

      See source code files in folder \Psection-3.7\Q.
    </solution*>
  </exercise>

  <\exercise>
    In the preceding example, the only use of <verbatim|f> is as a known
    procedure. Therefore the procedure built by the expression <verbatim|proc
    (y) -(y,x)> is never used. Modify the translator so that such a procedure
    is never constructed.

    <\solution*>
      \;

      See source code files in folder \Psection-3.7\Q.
    </solution*>
  </exercise>

  <chapter|State>

  <section|Computational Effects>

  <section|EXPLICIT-REFS: A Language with Explicit References>

  <\exercise>
    What would have happened had the program been instead

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let g = proc (dummy)

          \ \ \ \ \ \ \ \ \ let counter = newref(0)

          \ \ \ \ \ \ \ \ \ in begin

          \ \ \ \ \ \ \ \ \ \ \ \ \ setref(counter, -(deref(counter), -1));

          \ \ \ \ \ \ \ \ \ \ \ \ \ deref(counter)

          \ \ \ \ \ \ \ \ \ \ \ \ end

          in let a = (g 11)

          \ \ \ in let b = (g 11)

          \ \ \ \ \ \ in -(a,b)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      a = 1, b = 1, return 0.
    </solution*>
  </exercise>

  <\exercise>
    Write down the specification for a <verbatim|zero?-exp>.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|1|1|2|2|cell-tsep|3sep>|<cwith|1|1|2|2|cell-bborder|1ln>|<cwith|2|2|2|2|cell-tsep|5sep>|<cwith|2|2|2|2|cell-bsep|3sep>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|1><space|1em>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>
          = <verbatim|(><math|v a l<rsub|1>,>
          <math|\<sigma\><rsub|1>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|><verbatim|(value-of (zero?-exp ><math|e x
          p<rsub|1>><verbatim|)> \ <math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|=<mid|{><tabular|<tformat|<cwith|2|2|1|1|cell-tborder|0ln>|<table|<row|<cell|<text|<verbatim|(>><around*|\<lceil\>|<text|<verbatim|#t>>|\<rceil\>>,\<sigma\><rsub|1><text|<verbatim|)
          \ >if<verbatim|(expval-\<gtr\>num >>v a
          l<rsub|1><text|<verbatim|)>>=0 >>|<row|<cell|<text|<verbatim|(>><around*|\<lceil\>|<text|<verbatim|#f>>|\<rceil\>>,\<sigma\><rsub|1><text|<verbatim|)
          \ >if<verbatim|(expval-\<gtr\>num >>v a
          l<rsub|1><text|<verbatim|)>>\<neq\>0>>>>>>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Write down the specification for a <verbatim|call-exp>.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|1|1|2|2|cell-tsep|3sep>|<cwith|3|3|2|2|cell-tsep|5sep>|<cwith|3|3|2|2|cell-bsep|3sep>|<cwith|1|1|2|2|cell-bborder|0ln>|<cwith|1|1|2|2|cell-tborder|0ln>|<cwith|2|2|2|2|cell-bborder|1ln>|<cwith|2|2|2|2|cell-tborder|0ln>|<cwith|3|3|2|2|cell-tborder|0ln>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|r a t o
          r<space|1em>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)> =
          <verbatim|(><math|v a l<rsub|1>,>
          <math|\<sigma\><rsub|1>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|r a n
          d<space|1em>\<rho\><space|1em>\<sigma\><rsub|1>><verbatim|)> =
          <verbatim|(><math|v a l<rsub|2>,>
          <math|\<sigma\><rsub|2>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|><verbatim|(value-of (call-exp ><math|r a t o r<space|1em>r a
          n d><verbatim|)> \ <math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>

          = <verbatim|(apply-procedure \ ><math|v a l<rsub|1><space|1em>v a
          l<rsub|2><space|1em>\<sigma\><rsub|2>><rsub|><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Write down the specification for a <verbatim|begin> expresssion.

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <em|Expression><space|1em>::=<space|1em><verbatim|begin><space|1em><em|Expression><space|1em>{;<space|1em><em|Expression>}*<space|1em><verbatim|end>
      </cell>>>>
    </wide-tabular>

    A <verbatim|begin> expression may contain one or more subexpressions
    separated by semicolons. These are evaluated in order and the value of
    the last is returned.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|1|1|2|2|cell-tsep|3sep>|<cwith|1|1|2|2|cell-bborder|0ln>|<cwith|1|1|2|2|cell-tborder|0ln>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>(begin-exp ><math|e x p s
          \<ast\><space|1em>e x p<text|<verbatim|)
          >>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>

          = <verbatim|(value-of ><math|e x
          p<space|1em>\<rho\><space|1em>\<sigma\><rsub|\<ast\>>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Write down the specification for <verbatim|list> (exercise 3.10).

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|1|1|2|2|cell-tsep|3sep>|<cwith|1|1|2|2|cell-bborder|0ln>|<cwith|1|1|2|2|cell-tborder|0ln>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x p s \<ast\><text|<verbatim|
          \ >>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>

          = <verbatim|((list-val (list ><math|v a
          l<rsub|\<ast\>>><verbatim|))>, <math|\<sigma\><rsub|\<ast\>>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Modify the rule given above so that a <verbatim|setref-exp> returns the
    value of the right-hand side.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|1|1|2|2|cell-tsep|3sep>|<cwith|3|3|2|2|cell-tsep|5sep>|<cwith|3|3|2|2|cell-bsep|3sep>|<cwith|1|1|2|2|cell-bborder|0ln>|<cwith|1|1|2|2|cell-tborder|0ln>|<cwith|2|2|2|2|cell-bborder|1ln>|<cwith|2|2|2|2|cell-tborder|0ln>|<cwith|3|3|2|2|cell-tborder|0ln>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|1><space|1em>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>
          = <verbatim|(><math|l,> <math|\<sigma\><rsub|1>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|2><space|1em>\<rho\><space|1em>\<sigma\><rsub|1>><verbatim|)>
          = <verbatim|(><math|v a l,> <math|\<sigma\><rsub|2>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|><verbatim|(value-of (setref-exp ><math|e x
          p<rsub|1><space|1em>e x p<rsub|2>><verbatim|)>
          \ <math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)> =
          <verbatim|(><math|<around*|\<lceil\>|v a l|\<rceil\>>>,
          <math|<around*|[|l=v a l|]>\<sigma\><rsub|2>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Modify the rule given above so that a <verbatim|setref-exp> returns the
    old contents of the location.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|1|1|2|2|cell-tsep|3sep>|<cwith|4|4|2|2|cell-tsep|5sep>|<cwith|4|4|2|2|cell-bsep|3sep>|<cwith|1|1|2|2|cell-bborder|0ln>|<cwith|1|1|2|2|cell-tborder|0ln>|<cwith|3|3|2|2|cell-bborder|1ln>|<cwith|3|3|2|2|cell-tborder|0ln>|<cwith|4|4|2|2|cell-tborder|0ln>|<cwith|4|4|3|3|cell-bsep|1sep>|<cwith|4|4|3|3|cell-tsep|1sep>|<twith|table-bsep|4spc>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|1><space|1em>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>
          = <verbatim|(><math|l,> <math|\<sigma\><rsub|1>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of (deref-exp ><math|l><verbatim|)><space|1em><math|\<rho\><space|1em>\<sigma\><rsub|1>><verbatim|)>
          = <verbatim|(><math|v a l<rsub|1>, \ \<sigma\><rsub|2>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|2><space|1em>\<rho\><space|1em>\<sigma\><rsub|2>><verbatim|)>
          = <verbatim|(><math|v a l<rsub|2>,>
          <math|\<sigma\><rsub|3>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|><verbatim|(value-of (setref-exp ><math|e x
          p<rsub|1><space|1em>e x p<rsub|2>><verbatim|)>
          \ <math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)> =
          <verbatim|(><math|<around*|\<lceil\>|v a l<rsub|1>|\<rceil\>>,
          \ \ <around*|[|l=v a l<rsub|2>|]>\<sigma\><rsub|3>><math|><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Show exactly where in our implementation of the store these operations
    take linear time rather than constant time.

    <\solution*>
      \;

      <verbatim|setref!> takes <math|\<Theta\><around*|(|n|)>> time,
      <verbatim|deref> depends on where <verbatim|list-ref> takes
      <math|\<Theta\><around*|(|n|)>> or <math|\<Theta\><around*|(|1|)>>
      time.
    </solution*>
  </exercise>

  <\exercise>
    Implement the store in constant time by representing it as a Scheme
    vector. What is lost by using this representation?

    <\solution*>
      \;

      Every <verbatim|newref> operation will copy entire old store to new
      store.
    </solution*>
  </exercise>

  <\exercise>
    Implement the <verbatim|begin> expression as specified in exercise 4.4.

    <\solution*>
      \;

      See source code files in folder \Psection-4.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    Implement <verbatim|list> from exercise 4.5.

    <\solution*>
      \;

      See source code files in folder \Psection-4.2\Q.
    </solution*>
  </exercise>

  <\exercise>
    Our understanding of the store, as expressed in this interpreter, depends
    on the meaning of effects in Scheme. In particular, it depends on us
    knowing when these effects take place in a Scheme program. We can avoid
    this dependency by writing an interpreter that more closely mimics the
    specification. In this interpreter, <verbatim|value-of> would return both
    a value and a store, just as in the specification. A fragment of this
    interpreter appears in figure 4.6. We call this a store-passing
    interpreter.\ 

    Extend this interpreter to cover all of the language EXPLICIT-REFS. Every
    procedure that might modify the store returns not just its usual value
    but also a new store. These are packaged in a data type called
    <verbatim|answer>. Complete this definition of <verbatim|value-of>.

    <\solution*>
      \;

      See source code files in folder \Psection-4.2/4.12~4.13\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the interpreter of the preceding exercise to have procedures of
    multiple arguments.

    <\solution*>
      \;

      See source code files in folder \Psection-4.2/4.12~4.13\Q.

      <em|<strong|note:>> I might have found a mistake in the book. In the
      code fragment of figure 4.6, <verbatim|var-exp> should return
      <verbatim|(apply-store store (apply-env env var))>, not an
      <verbatim|answer> type. Just like <verbatim|expval> type,
      <verbatim|answer> type constructor only should appear where returning
      expressed value, <verbatim|var-exp> returns the value it denoted, that
      is an <verbatim|answer> type stored in <verbatim|store>.
    </solution*>
  </exercise>

  <section|IMPLICIT-REFS: A Language with Implicit References>

  <\exercise>
    Write the rule for <verbatim|let>.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|1|1|2|2|cell-tsep|3sep>|<cwith|1|1|2|2|cell-bborder|1ln>|<cwith|2|2|2|2|cell-tsep|5sep>|<cwith|2|2|2|2|cell-bsep|3sep>|<twith|table-bsep|4spc>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|><space|1em>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>
          = <verbatim|(><math|v a l<rsub|>,>
          <math|\<sigma\><rsub|1>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|><verbatim|(value-of (let-exp ><math|v a r<space|1em>e x
          p<rsub|><space|1em>b o d y><verbatim|)>
          \ <math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>

          = <verbatim|(value-of ><math|b o d y<space|1em><around*|[|v a
          r=l|]>\<rho\><space|1em><around*|[|l=v a l|]>\<sigma\>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    In figure 4.8, why are variables in the environment bound to plain
    integers rather than expressed values, as in figure 4.5?

    <\solution*>
      \;

      Implicit references.
    </solution*>
  </exercise>

  <\exercise>
    Now that variables are mutable, we can build recursive procedures by
    assignment. For example

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          letrec times4(x) = if zero?(x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 0

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else -((times4 -(x,1)), -4)

          in (times4 3)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    can be replaced by

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let times4 = 0

          in begin

          \ \ \ \ set times4(x) = proc (x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if zero?(x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 0

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else -((times4 -(x,1)),
          -4);

          \ \ \ \ (times4 3)

          \ \ \ end
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    Trace this by hand and verify that this translation works.

    <\solution*>
      \;

      See source file in \Psection-4.3/test.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Write the rules for and implement multiargument procedures and
    <verbatim|let> expressions.

    <\solution*>
      \;

      See source files in folder \Psection-4.3\Q.
    </solution*>
  </exercise>

  <\exercise>
    Write the rule for and implement multiprocedure <verbatim|letrec>
    expressions.

    <\solution*>
      \;

      See source files in folder \Psection-4.3\Q.
    </solution*>
  </exercise>

  <\exercise>
    Modify the implementation of multiprocedure <verbatim|letrec> so that
    each closure is built only once, and only one location is allocated for
    it. This is like exercise 3.35.

    <\solution*>
      \;

      See source files in folder \Psection-4.3\Q.
    </solution*>
  </exercise>

  <\exercise>
    In the language of this section, all variables are mutable, as they are
    in Scheme. Another alternative is to allow both mutable and immutable
    variable bindings:

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
        <em|ExpVal<space|1em>=<space|1em>Int + Bool + Proc>
      </cell>>|<row|<\cell>
        <em|DenVal<space|1em>=<space|1em> Ref(ExpVal) + ExpVal>
      </cell>>>>
    </wide-tabular>

    Variable assignment should work only when the variable to be assigned to
    has a mutable binding. Dereferencing occurs implicitly when the denoted
    value is a reference.

    Modify the language of this section so that <verbatim|let> introduces
    immutable variables, as before, but mutable variables are introduced by a
    <verbatim|letmutable> expression, with syntax given by

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <em|<em|<em|Expression><space|1em>::= \ <verbatim|letmutable
        ><em|Identifier><space|1em>=<space|1em><em|Expression><verbatim| in
        ><em|Expression>>>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      Environment has two types value, <em|Ref(ExpVal)> and <em|ExpVal>.
      <em|Ref(ExpVal)> is mutable, <em|ExpVal> is immutable.
    </solution*>
  </exercise>

  <\exercise>
    We suggested earlier the use of assignment to make a program more modular
    by allowing one procedure to communicate information to a distant
    procedure without requiring intermediate procedures to be aware of it.
    Very often such an assignment should only be temporary, lasting for the
    execution of a procedure call. Add to the language a facility for
    <em|dynamic assignment> (also called <em|fluid binding>) to accomplish
    this. Use the production

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<\cell>
        <em|Expression> ::=
      </cell>|<\cell>
        <em|<em|<verbatim|setdynamic ><em|Identifier> =
        <em|Expression><verbatim| during ><em|Expression>>>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          setdynamic-exp (var exp1 body)
        </frame>
      </cell>>>>
    </wide-tabular>

    The effect of the <verbatim|setdynamic> expression is to assign
    temporarily the value of <math|e x p<rsub|1>> to <em|var>, evaluate
    <em|body>, reassign <em|var> to its original value, and return the value
    of <em|body>. The variable var must already be bound. For example, in

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let x = 11

          in let p = proc (y) -(y,x)

          \ \ \ in -(setdynamic x = 17 during (p 22), (p 13))
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    the value of <verbatim|x>, which is free in procedure <verbatim|p>, is 17
    in the call <verbatim|(p 22)>, but is reset to 11 in the call
    <verbatim|(p 13)>, so the value of the expression is 5 - 2 = 3.

    <\solution*>
      \;

      See source files in folder \Psection-4.3/4.21\Q.
    </solution*>
  </exercise>

  <\exercise>
    So far our languages have been expression-oriented: the primary syntactic
    category of interest has been expressions and we have primarily been
    interested in their values. Extend the language to model the simple
    statement-oriented language whose specification is sketched below. Be
    sure to <em|Follow the Grammar> by writing separate procedures to handle
    programs, statements, and expressions.

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-rsep|0fn>|<cwith|3|3|1|1|cell-halign|c>|<cwith|6|6|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-tsep|4sep>|<cwith|1|-1|1|1|cell-bsep|4sep>|<twith|table-tsep|0>|<twith|table-bsep|0>|<cwith|1|-1|1|1|cell-valign|B>|<table|<row|<\cell>
        <\description>
          <item*|Values>As in IMPLICIT-REFS.
        </description>
      </cell>>|<row|<\cell>
        <\description>
          <item*|Syntax>Use the following syntax:
        </description>
      </cell>>|<row|<\cell>
        <tabular|<tformat|<cwith|1|-1|2|2|cell-bsep|2sep>|<cwith|1|-1|2|2|cell-tsep|2sep>|<cwith|1|-1|2|2|cell-rsep|2spc>|<cwith|1|-1|2|2|cell-lsep|2spc>|<table|<row|<cell|<em|Program>>|<cell|::=>|<cell|<em|Statement>>>|<row|<cell|<em|Statement>>|<cell|::=<math|>>|<cell|<em|Identifier
        = Expression>>>|<row|<cell|>|<cell|::=>|<cell|<verbatim|print>
        <em|Expression>>>|<row|<cell|>|<cell|::=>|<cell|<verbatim|{>{<em|Statement>}<math|<rsup|*\<ast\><around*|(|;|)>>><verbatim|
        }>>>|<row|<cell|>|<cell|::=>|<cell|<verbatim|if
        ><em|Expression<space|1em>Statement<space|1em>Statement>>>|<row|<cell|>|<cell|::=>|<cell|<verbatim|while
        ><em|Expresion<space|1em>Statement>>>|<row|<cell|>|<cell|::=>|<cell|<verbatim|var
        >{<em| Identifier >}<math|<rsup|\<ast\><around*|(|,|)>>> <verbatim|;>
        <em|Statement>>>>>>
      </cell>>|<row|<\cell>
        <\wide-tabular>
          <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|3|3|cell-width|2spc>|<cwith|1|-1|3|3|cell-hmode|exact>|<table|<row|<\cell>
            \;
          </cell>|<\cell>
            The nonterminal <em|Expression> refers to the language of
            expressions of IMPLICIT-REFS, perhaps with some extensions.
          </cell>|<\cell>
            \;
          </cell>>>>
        </wide-tabular>
      </cell>>|<row|<\cell>
        <\description>
          <item*|Semantics>A program is a statement. A statement does not
          return a value, but acts by modifying the store and by printing.\ 

          Assignment statements work in the usual way. A print statement
          evaluates its actual parameter and prints the result. The
          <verbatim|if> statement works in the usual way. A block statement,
          defined in the last production for <em|Statement>, binds each of
          the declared variables to an uninitialized reference and then
          executes the body of the block. The scope of these bindings is the
          body. Write the specification for statements using assertions like
        </description>
      </cell>>|<row|<\cell>
        <verbatim|(result-of > <em|stmt><space|1em><math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>
        = <math|\<sigma\><rsub|1>>
      </cell>>|<row|<\cell>
        <\description>
          <item*|Example>Here are some examples.
        </description>
      </cell>>|<row|<\cell>
        <\wide-tabular>
          <tformat|<cwith|2|2|1|1|cell-bsep|8sep>|<cwith|2|2|1|1|cell-tsep|1sep>|<cwith|3|3|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|1sep>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-bsep|12sep>|<cwith|1|1|1|1|cell-bborder|0ln>|<cwith|2|2|2|2|cell-tsep|1sep>|<cwith|1|-1|3|3|cell-width|7spc>|<cwith|1|-1|3|3|cell-hmode|exact>|<cwith|3|3|2|2|cell-rsep|1spc>|<cwith|3|3|2|2|cell-lsep|1spc>|<cwith|3|3|2|2|cell-tsep|2sep>|<cwith|3|3|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-bsep|8sep>|<cwith|1|1|2|2|cell-tsep|1sep>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|2|2|2|2|cell-valign|B>|<table|<row|<\cell>
            \;
          </cell>|<\cell>
            <\verbatim>
              (run "var x,y; {x = 3; y = 4; print +(x,y)}") \ % Example 1

              7

              (run "var x,y,z; {x = 3; \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ %
              Example 2

              \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ y = 4;

              \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ z = 0;

              \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ while not(zero?(x))

              \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {z = +(z,y); x =
              -(x,1)};

              \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ print z}")

              12

              (run "var x; {x = 3; \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ %
              Example 3

              \ \ \ \ \ \ \ \ \ \ \ \ \ \ print x;

              \ \ \ \ \ \ \ \ \ \ \ \ \ \ var x; {x = 4; print x};

              \ \ \ \ \ \ \ \ \ \ \ \ \ \ print x}")

              3

              4

              3

              (run "var f,x; {f = proc(x,y) *(x,y); \ \ \ \ \ \ \ \ \ %
              Example 4

              \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ x = 3;

              \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ print (f 4 x)}")

              12
            </verbatim>
          </cell>|<\cell>
            \;
          </cell>>|<row|<\cell>
            \;
          </cell>|<\cell>
            Example 3 illustrates the scoping of the block statement.
          </cell>|<\cell>
            \;
          </cell>>|<row|<\cell>
            \;
          </cell>|<\cell>
            Example 4 illustrates the interaction between statements and
            expressions. A procedure value is created and stored in the
            variable <verbatim|f>. In the last line, this procedure is
            applied to the actual parameters <verbatim|4> and <verbatim|x>;
            since <verbatim|x> is bound to a reference, it is dereferenced to
            obtain <verbatim|3>.
          </cell>|<\cell>
            \;
          </cell>>>>
        </wide-tabular>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      See source files in folder \Psection-4.3/4.22~4.24\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add to the language of exercise 4.22 <verbatim|read> statements of the
    form <verbatim|read> <em|var>. This statement reads a nonnegative integer
    from the input and stores it in the given variable.

    <\solution*>
      \;

      See source files in folder \Psection-4.3/4.22~4.24\Q.
    </solution*>
  </exercise>

  <\exercise>
    A <verbatim|do-while> statement is like a <verbatim|while> statement,
    except that the test is performed <em|after> the execution of the body.
    Add <verbatim|do-while> statements to the language of exercise 4.22.

    <\solution*>
      \;

      See source files in folder \Psection-4.3/4.22~4.24\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the block statement of the language of exercise 4.22 to allow
    variables to be initialized. In your solution, does the scope of a
    variable include the initializer for variables declared later in the same
    block statement?

    <\solution*>
      \;

      See source files in folder \Psection-4.3/4.25~4.27\Q.

      Yes, but it is used sequentially just like <verbatim|let*> in Scheme.
    </solution*>
  </exercise>

  <\exercise>
    Extend the solution to the preceding exercise so that procedures declared
    in a single block are mutually recursive. Consider restricting the
    language so that the variable declarations in a block are followed by the
    procedure declarations.

    <\solution*>
      \;

      See source files in folder \Psection-4.3/4.25~4.27\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the language of the preceding exercise to include
    <em|subroutines>. In our usage a subroutine is like a procedure, except
    that it does not return a value and its body is a statement, rather than
    an expression. Also, add subroutine calls as a new kind of statement and
    extend the syntax of blocks so that they may be used to declare both
    procedures and subroutines. How does this affect the denoted and
    expressed values? What happens if a procedure is referenced in a
    subroutine call, or vice versa?

    <\solution*>
      \;

      See source files in folder \Psection-4.3/4.25~4.27\Q.

      Denoted value is still <em|Ref(ExpVal)>, expressed value add a
      <em|Subproc>.\ 

      Procedure in subroutine, just return a value for the statement.

      Subroutine in procedure, I think that if subroutine is <em|call by
      reference>, then it is more useful than <em|natural parameter passing>,
      it can be used for modifying the value of outer variable, not only
      printing something. If that, it will deviate from the consistency of
      IMPLICIT-REFS.
    </solution*>
  </exercise>

  <section|MUTABLE-PAIRS: A Language with Mutable Pairs>

  <\exercise>
    Write down the specification rules for the five mutable-pair operations.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|2|2|2|2|cell-tsep|3sep>|<cwith|2|2|2|2|cell-bborder|1ln>|<cwith|3|3|2|2|cell-tsep|5sep>|<cwith|3|3|2|2|cell-bsep|3sep>|<twith|table-bsep|4spc>|<cwith|1|1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|30spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          <verbatim|newpair-exp>
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|1><rsub|><space|1em>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>
          = <verbatim|(><math|v a l<rsub|1>,>
          <math|\<sigma\><rsub|1>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|2><rsub|><space|1em>\<rho\><space|1em>\<sigma\><rsub|1>><verbatim|)>
          = <verbatim|(><math|v a l<rsub|2>,>
          <math|\<sigma\><rsub|2>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|><verbatim|(value-of (newpair-exp ><math|e x
          p<rsub|1><space|1em>e x p<rsub|2><rsub|>><verbatim|)>
          \ <math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>

          = <verbatim|(><math| <around*|\<lceil\>|p a i
          r<around*|(|l<rsub|1>,l<rsub|2>|)>|\<rceil\>>,
          <around*|[|l<rsub|2>=v a l<rsub|2>,l<rsub|1>=v a
          l<rsub|1>|]>\<sigma\><rsub|2>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>

      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|2|2|2|2|cell-tsep|3sep>|<cwith|2|2|2|2|cell-bborder|1ln>|<cwith|3|3|2|2|cell-tsep|5sep>|<cwith|3|3|2|2|cell-bsep|3sep>|<twith|table-bsep|4spc>|<cwith|1|1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|30spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          <verbatim|left-exp>
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|><space|1em>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>
          = <verbatim|(><math|v a l,> <math|\<sigma\><rsub|1>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|<around*|\<lfloor\>|v a l|\<rfloor\>>=<text|<verbatim|(>>p a
          i r<around*|(|l<rsub|1>,l<rsub|2>|)>,\<sigma\><rsub|2>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|><verbatim|(value-of (left-exp ><math|e x p><verbatim|)>
          \ <math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)> =
          <verbatim|(><math|\<sigma\><around*|(|l<rsub|1>|)>,\<sigma\><rsub|2>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>

      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|2|2|2|2|cell-tsep|3sep>|<cwith|2|2|2|2|cell-bborder|1ln>|<cwith|3|3|2|2|cell-tsep|5sep>|<cwith|3|3|2|2|cell-bsep|3sep>|<twith|table-bsep|4spc>|<cwith|1|-1|1|1|cell-width|30spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<\cell>
          <verbatim|right-exp>
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|><space|1em>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>
          = <verbatim|(><math|v a l,> <math|\<sigma\><rsub|1>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|<around*|\<lfloor\>|v a l|\<rfloor\>>=<text|<verbatim|(>>p a
          i r<around*|(|l<rsub|1>,l<rsub|2>|)>,\<sigma\><rsub|2>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|><verbatim|(value-of (right-exp ><math|e x p><verbatim|)>
          \ <math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)> =
          <verbatim|(><math|\<sigma\><around*|(|l<rsub|2>|)>,\<sigma\><rsub|2>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>

      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|3|3|2|2|cell-tsep|3sep>|<cwith|3|3|2|2|cell-bborder|1ln>|<cwith|4|4|2|2|cell-tsep|5sep>|<cwith|4|4|2|2|cell-bsep|3sep>|<twith|table-bsep|4spc>|<cwith|1|1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|30spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          <verbatim|setleft-exp>
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|1><rsub|><space|1em>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>
          = <verbatim|(><math|v a l<rsub|1>,>
          <math|\<sigma\><rsub|1>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|2><rsub|><space|1em>\<rho\><space|1em>\<sigma\><rsub|1>><verbatim|)>
          = <verbatim|(><math|v a l<rsub|2>,>
          <math|\<sigma\><rsub|2>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|<around*|\<lfloor\>|v a l<rsub|1>|\<rfloor\>>=<text|<verbatim|(>>p
          a i r<around*|(|l<rsub|1>,l<rsub|2>|)>,\<sigma\><rsub|3>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|><verbatim|(value-of (setleft-exp ><math|e x
          p<rsub|1><space|1em>e x p<rsub|2><rsub|>><verbatim|)>
          \ <math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>

          = <verbatim|(><math| <around*|\<lceil\>|82|\<rceil\>>,
          <around*|[|l<rsub|1>=v a l<rsub|2>|]>\<sigma\><rsub|3>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>

      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|3|3|2|2|cell-tsep|3sep>|<cwith|3|3|2|2|cell-bborder|1ln>|<cwith|4|4|2|2|cell-tsep|5sep>|<cwith|4|4|2|2|cell-bsep|3sep>|<twith|table-bsep|4spc>|<cwith|1|-1|1|1|cell-width|30spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<\cell>
          <verbatim|setright-exp>
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|1><rsub|><space|1em>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>
          = <verbatim|(><math|v a l<rsub|1>,>
          <math|\<sigma\><rsub|1>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of <em|>><math|e x
          p<rsub|2><rsub|><space|1em>\<rho\><space|1em>\<sigma\><rsub|1>><verbatim|)>
          = <verbatim|(><math|v a l<rsub|2>,>
          <math|\<sigma\><rsub|2>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|<around*|\<lfloor\>|v a l<rsub|1>|\<rfloor\>>=<text|<verbatim|(>>p
          a i r<around*|(|l<rsub|1>,l<rsub|2>|)>,\<sigma\><rsub|3>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|><verbatim|(value-of (setright-exp ><math|e x
          p<rsub|1><space|1em>e x p<rsub|2><rsub|>><verbatim|)>
          \ <math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>

          = <verbatim|(><math| <around*|\<lceil\>|83|\<rceil\>>,
          <around*|[|l<rsub|2>=v a l<rsub|2>|]>\<sigma\><rsub|3>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Add arrays to this language. Introduce new operators newarray, arrayref,
    and arrayset that create, dereference, and update arrays. This leads to

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let a = newarry(2,-99)

          \ \ \ \ p = proc (x)

          \ \ \ \ \ \ \ \ \ let v = arrayref(x,1)

          \ \ \ \ \ \ \ \ \ in arrayset(x,1,-(v,-1))

          in begin arrayset(a,1,0);

          \ \ \ \ \ \ \ \ \ (p a);

          \ \ \ \ \ \ \ \ \ (p a);

          \ \ \ \ \ \ \ \ \ arrayref(a,1) end
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    Here <verbatim|newarray(2,-99>) is intended to build an array of size 2,
    with each location in the array containing -99. begin expressions are
    defined in exercise 4.4. Make the array indices zero-based, so an array
    of size 2 has indices 0 and 1.

    <\solution*>
      \;

      See source files in folder \Psection-4.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add to the language of exercise 4.29 a procedure <verbatim|arraylength>,
    which returns the size of an array. Your procedure should work in
    constant time. Make sure that <verbatim|arrayref> and <verbatim|arrayset>
    check to make sure that their indices are within the length of the array.

    <\solution*>
      \;

      See source files in folder \Psection-4.4\Q.
    </solution*>
  </exercise>

  <section|Parameter-Passing Variations>

  <\exercise>
    Write out the specification rules for CALL-BY-REFERENCE.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|2|2|2|2|cell-tsep|3sep>|<cwith|2|2|2|2|cell-bborder|1ln>|<cwith|3|3|2|2|cell-tsep|5sep>|<cwith|3|3|2|2|cell-bsep|3sep>|<twith|table-bsep|4spc>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of ><math|r a t o
          r<space|1em>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)> =
          <verbatim|(><math|f,\<sigma\><rsub|1>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of ><math|r a n
          d<space|1em>\<rho\><space|1em>\<sigma\><rsub|1>><verbatim|)> =
          <math|<mid|{><tabular|<tformat|<table|<row|<cell|<text|<verbatim|if
          >>r a n d= <text|<verbatim|var-exp>,<space|1em>><around*|(|r e
          f=\<rho\><around*|(|r a n d|)>,\<sigma\><rsub|1>|)>>>|<row|<cell|<text|<verbatim|else
          >><around*|(|r e f,<around*|[|r e f=v a
          l|]>\<sigma\><rsub|2>|)>>>>>>>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|><verbatim|(value-of (call-exp ><math|r a t o r<space|1em>r a
          n d ><verbatim|)> \ <math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>

          = <verbatim|(apply-procedure ><math|f<space|1em>r e f><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Extend the language CALL-BY-REFERENCE to have procedures of multiple
    arguments.

    <\solution*>
      \;

      See source files in folder \Psection-4.5\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the language CALL-BY-REFERENCE to support call-by-value procedures
    as well.

    <\solution*>
      \;

      See source files in folder \Psection-4.5\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add a call-by-reference version of <verbatim|let>, called
    <verbatim|letref>, to the language. Write the specification and implement
    it.

    <\solution*>
      \;

      See source files in folder \Psection-4.5\Q.
    </solution*>
  </exercise>

  <\exercise>
    We can get some of the benefits of call-by-reference without leaving the
    call-by-value framework. Extend the language IMPLICIT-REFS by adding a
    new expression

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-lsep|4spc>|<table|<row|<\cell>
        <em|Expression><space|1em>::=
      </cell>|<\cell>
        <verbatim|ref> <em|Identifier>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          ref-exp (var)
        </frame>
      </cell>>>>
    </wide-tabular>

    This differs from the language EXPLICIT-REFS, since references are only
    of variables. This allows us to write familiar programs such as
    <verbatim|swap> within our call-by-value language. What should be the
    value of this expression?

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let a = 3

          in let b = 4

          \ \ \ in let swap = proc (x) proc (y)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ let temp = deref(x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ in begin

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ setref(x,deref(y));

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ setref(y,temp)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ end

          \ \ \ \ \ \ in begin ((swap ref a) ref b); -(a,b) end
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    Here we have used a version of let with multiple declarations (exercise
    3.16). What are the expressed and denoted values of this language?

    <\solution*>
      \;

      The value fo this expression is 1.

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|l>|<table|<row|<\cell>
          <em|ExpVal<space|1em>=<space|1em>Int + Bool + Proc+Ref(ExpVal)>
        </cell>>|<row|<\cell>
          <em|DenVal<space|1em>=<space|1em> Ref(ExpVal)>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Most languages support arrays, in which case array references are
    generally treated like variable references under call-by-reference. If an
    operand is an array reference, then the location referred to, rather than
    its contents, is passed to the called procedure. This allows, for
    example, a swap procedure to be used in commonly occurring situations in
    which the values in two array elements are to be exchanged. Add array
    operators like those of exercise 4.29 to the call-by-reference language
    of this section, and extend <verbatim|value-of-operand> to handle this
    case, so that, for example, a procedure application like

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <verbatim|((swap (arrayref a i)) (arrayref a j))>
      </cell>>>>
    </wide-tabular>

    will work as expected. What should happen in the case of

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <verbatim|((swap (arrayref a (arrayref a i))) (arrayref a j))> ?
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      It depends on the way <verbatim|swap> implemented. If <verbatim|swap>
      is implemented same as preceding exercise, then report a extract-expval
      error. <verbatim|arrayref> returns a <em|ref-val>, however,
      <verbatim|arrayref> expects a <em|arr-val> and a <em|num-val>.
    </solution*>
  </exercise>

  <\exercise>
    <em|Call-by-value-result> is a variation on call-by-reference. In
    call-by-value-result, the actual parameter must be a variable. When a
    parameter is passed, the formal parameter is bound to a new reference
    initialized to the value of the actual parameter, just as in
    call-by-value. The procedure body is then executed normally. When the
    procedure body returns, however, the value in the new reference is copied
    back into the reference denoted by the actual parameter. This may be more
    efficient than call-by-reference because it can improve memory locality.
    Implement call-by-value-result and write a program that produces
    different answers using call-by-value-result and call-by-reference.

    <\solution*>
      \;

      See source files in folder \Psection-4.5\Q.
    </solution*>
  </exercise>

  <\exercise>
    The example below shows a variation of exercise 3.25 that works under
    call-by-need. Does the original program in exercise 3.25 work under
    call-by-need? What happens if the program below is run under
    call-by-value? Why?

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let makerec = proc (f)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ let d = proc (x) (f (x x))

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ in (f (d d))

          in let maketimes4 = proc (f)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ proc (x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if zero?(x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 0

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else -((f -(x,1)), -4)

          \ \ \ in let times4 = (makerec maketimes4)

          \ \ \ \ \ \ in (times4 3)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      Under call-by-need, returns 12.

      Under call-by-value, didn't return. It is a infinite-loop in
      <verbatim|(f (d d))>.
    </solution*>
  </exercise>

  <\exercise>
    In the absence of effects, call-by-name and call-by-need always give the
    same answer. Construct an example in which call-by-name and call-by-need
    give different answers.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\verbatim-code>
            let x = 0

            \ \ \ \ say = proc (a, b, c)

            \ \ \ \ \ \ \ \ \ \ \ if a then b then c

            in say(zero?(x), x, error("arise a error"))
          </verbatim-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Modify <verbatim|value-of-operand> so that it avoids making thunks for
    constants and procedures.

    <\solution*>
      \;

      See source files in folder \Psection-4.5/4.40~4.42\Q.
    </solution*>
  </exercise>

  <\exercise>
    Write out the specification rules for call-by-name and call-by-need.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rsep|0fn>|<cwith|1|-1|2|2|cell-bsep|3sep>|<cwith|1|-1|2|2|cell-tsep|3sep>|<cwith|2|2|2|2|cell-tsep|3sep>|<cwith|2|2|2|2|cell-bborder|1ln>|<cwith|3|3|2|2|cell-tsep|5sep>|<cwith|3|3|2|2|cell-bsep|3sep>|<twith|table-bsep|4spc>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of ><math|r a t o
          r<space|1em>\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)> =
          <verbatim|(><math|f,\<sigma\><rsub|1>><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(value-of ><math|r a n
          d<space|1em>\<rho\><space|1em>\<sigma\><rsub|1>><verbatim|)> =
          <math|<mid|{><tabular|<tformat|<table|<row|<cell|<text|<verbatim|if
          >>r a n d= <text|<verbatim|var-exp>,<space|1em>><around*|(|r e
          f=\<rho\><around*|(|r a n d|)>,\<sigma\><rsub|1>|)>>>|<row|<cell|<text|<verbatim|else
          >><around*|(|r e f,<around*|[|r e f=t h u n
          k|]>\<sigma\><rsub|2>|)>>>>>>>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <math|><verbatim|(value-of (call-exp ><math|r a t o r<space|1em>r a
          n d ><verbatim|)> \ <math|\<rho\><space|1em>\<sigma\><rsub|0>><verbatim|)>

          = <verbatim|(apply-procedure ><math|f<space|1em>r e f><verbatim|)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Add a lazy <verbatim|let> to the call-by-need interpreter.

    <\solution*>
      \;

      See source files in folder \Psection-4.5/4.40~4.42\Q.
    </solution*>
  </exercise>

  <chapter|Continuation-Passing Interpreters>

  <section|A Continuation-Passing Interpreter>

  <\exercise>
    Implement this data type of continuations using the procedural
    representation.

    <\solution*>
      \;

      See source code file in \Psection-5.1/procedural-continuation.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Implement this data type of continuations using a data-structure
    representation.

    <\solution*>
      \;

      See source code file in \Psection-5.1/evaluation.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add <verbatim|let2> to this interpreter. A <verbatim|let2> expression is
    like a <verbatim|let> expression, except that it defines exactly two
    variables.

    <\solution*>
      \;

      It is a multideclaration <verbatim|let>. See source files in folder
      \Psection-5.1\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add <verbatim|let3> to this interpreter. A <verbatim|let3> expression is
    like a <verbatim|let> expression, except that it defines exactly three
    variables.

    <\solution*>
      \;

      It is a multideclaration <verbatim|let>. See source files in folder
      \Psection-5.1\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add lists to the language, as in exercise 3.9.

    <\solution*>
      \;

      See next exercise.
    </solution*>
  </exercise>

  <\exercise>
    Add a <verbatim|list> expression to the language, as in exercise 3.10. As
    a hint, consider adding two new continuation-builders, one for evaluating
    the first element of the list and one for evaluating the rest of the
    list.

    <\solution*>
      \;

      The fragment of <verbatim|value-of/k>,

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\scm-code>
            ...

            [list-exp

            \ (exps)

            \ (if (null? exps)

            \ \ \ \ \ (apply-cont cont (list-val '()))

            \ \ \ \ \ (value-of/k (car exps) env

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (list-cont '() (cdr exps) env
            cont)))]

            ...
          </scm-code>
        </cell>>>>
      </wide-tabular>

      \;

      the fragment of <verbatim|apply-cont>,

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\scm-code>
            ...

            [list-cont

            \ (vals exps env saved-cont)

            \ (let ([vals (append vals (list (expval-\<gtr\>any val)))])

            \ \ \ (if (null? exps)

            \ \ \ \ \ \ \ (apply-cont saved-cont (list-val vals))

            \ \ \ \ \ \ \ (value-of/k (car exps) env

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (list-cont '() (cdr exps)
            env saved-cont))))]

            ...
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Add multideclaration <verbatim|let> (exercise 3.16) to this interpreter.

    <\solution*>
      \;

      See source files in folder \Psection-5.1\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add multiargument procedures (exercise 3.21) to this interpreter.

    <\solution*>
      \;

      See source files in folder \Psection-5.1\Q.
    </solution*>
  </exercise>

  <\exercise>
    Modify this interpreter to implement the IMPLICIT-REFS language. As a
    hint, consider including a new continuation-builder
    <verbatim|(set-rhs-cont env var cont)>.

    <\solution*>
      \;

      See source files in folder \Psection-5.1\Q.
    </solution*>
  </exercise>

  <\exercise>
    Modify the solution to the previous exercise so that the environment is
    not kept in the continuation.

    <\solution*>
      \;

      See source files in folder \Psection-5.1\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add the <verbatim|begin> expression of exercise 4.4 to the
    continuation-passing interpreter. Be sure that no call to
    <verbatim|value-of> or <verbatim|value-of-rands> occurs in a position
    that would build control context.

    <\solution*>
      \;

      See source files in folder \Psection-5.1\Q.
    </solution*>
  </exercise>

  <\exercise>
    Instrument the interpreter of figures 5.4\U5.6 to produce output similar
    to that of the calculation on page 150.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Translate the definitions of <verbatim|fact> and <verbatim|fact-iter>
    into the LETREC language. You may add a multiplication operator to the
    language. Then, using the instrumented interpreter of the previous
    exercise, compute <verbatim|(fact 4)> and <verbatim|(fact-iter 4)>.
    Compare them to the calculations at the beginning of this chapter. Find
    <verbatim|(* 4 (* 3 (* 2 (fact 1))))> in the trace of <verbatim|(fact
    4)>. What is the continuation of <verbatim|apply-procedure/k> for this
    call of <verbatim|(fact 1)>?

    <\solution*>
      \;

      See source code file in \Psection-5.1/test.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    The instrumentation of the preceding exercise produces voluminous output.
    Modify the instrumentation to track instead only the size of the largest
    continuation used during the calculation. We measure the size of a
    continuation by the number of continuation-builders employed in its
    construction, so the size of the largest continuation in the calculation
    on page 150 is 3. Then calculate the values of fact and fact-iter applied
    to several operands. Confirm that the size of the largest continuation
    used by fact grows linearly with its argument, but the size of the
    largest continuation used by fact-iter is a constant.

    <\solution*>
      \;

      Counting is too cumbersome for the datum defined by
      <verbatim|define-datatype>. If there is represented by list, it will be
      simple.

      :(
    </solution*>
  </exercise>

  <\exercise>
    Our continuation data type contains just the single constant,
    <verbatim|end-cont>, and all the other continuation-builders have a
    single continuation argument. Implement continuations by representing
    them as lists, where <verbatim|(end-cont)> is represented by the empty
    list, and each other continuation is represented by a nonempty list whose
    car contains a distinctive data structure (called <em|frame> or
    <em|activation record>) and whose cdr contains the embedded continuation.
    Observe that the interpreter treats these lists like a stack (of frames).

    <\solution*>
      \;

      :)

      See source code in file \Psection-5.1/list-continuation.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the continuation-passing interpreter to the language of exercise
    4.22. Pass a continuation argument to <verbatim|result-of>, and make sure
    that no call to <verbatim|result-of> occurs in a position that grows a
    control context. Since a statement does not return a value, distinguish
    between ordinary continuations and continuations for statements; the
    latter are usually called <em|command continuations>. The interface
    should include a procedure <verbatim|apply-command-cont> that takes a
    command continuation and invokes it. Implement command continuations both
    as data structures and as zero-argument procedures.

    <\solution*>
      \;

      The <em|statement> takes effect same as <em|begin-exp>.
    </solution*>
  </exercise>

  <section|A Trampolined Interpreter>

  <\exercise>
    Modify the trampolined interpreter to wrap <verbatim|(lambda () ...)>
    around each call (there's only one) to <verbatim|apply-procedure/k>. Does
    this modification require changing the contracts?

    <\solution*>
      \;

      No.
    </solution*>
  </exercise>

  <\exercise>
    The trampoline system in figure 5.7 uses a procedural representation of a
    <em|Bounce>. Replace this by a data structure representation.

    <\solution*>
      \;

      No matter what data-structure is represented, the inner is procedure.
    </solution*>
  </exercise>

  <\exercise>
    Instead of placing the <verbatim|(lambda () ...)> around the body of
    <verbatim|apply-procedure/k>, place it around the body of
    <verbatim|apply-cont>. Modify the contracts to match this change. Does
    the definition of <em|Bounce> need to change? Then replace the procedural
    representation of <em|Bounce> with a data-structure representation, as in
    exercise 5.18.

    <\solution*>
      \;

      No need to change.
    </solution*>
  </exercise>

  <\exercise>
    In exercise 5.19, the last bounce before <verbatim|trampoline> returns a
    <em|FinalAnswer> is always something like <verbatim|(apply-cont
    (end-cont) val)>, where <em|val> is some <em|ExpVal>. Optimize your
    representation of bounces in exercise 5.19 to take advantage of this
    fact.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\scm-code>
            (define apply-cont

            \ \ (lambda (cont val)

            \ \ \ \ (list cont val

            \ \ \ \ \ \ \ \ \ \ (lambda ()

            \ \ \ \ \ \ \ \ \ \ \ \ (cases continuation cont

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ (... val)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ (... (value-of/k ...))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ (... (apply-cont ...))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ (... (apply-procedure/k ...)))))))

            \;

            (define trampoline

            \ \ (lambda (bounce)

            \ \ \ \ (cond

            \ \ \ \ \ \ [(expval? bounce) \ bounce]

            \ \ \ \ \ \ [(end-cont? (car bounce)) (cadr bounce)]

            \ \ \ \ \ \ [else (trampoline ((list-ref bounce 2)))])))
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Implement a trampolining interpreter in an ordinary procedural language.
    Use a data structure representation of the snapshots as in exercise 5.18,
    and replace the recursive call to <verbatim|trampoline> in its own body
    by an ordinary <verbatim|while> or other looping construct.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\scm-code>
            (define trampoline

            \ \ (lambda (bounce)

            \ \ \ \ (while (procedure? bounce)

            \ \ \ \ \ \ (set! bounce (bounce)))

            \ \ \ \ bounce))
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    One could also attempt to transcribe the environment-passing interpreters
    of chapter 3 in an ordinary procedural language. Such a transcription
    would fail in all but the simplest cases, for the same reasons as
    suggested above. Can the technique of trampolining be used in this
    situation as well?

    <\solution*>
      \;

      I think that trampoline satisfies in tail-calling chain, and there
      could be recursive or not.
    </solution*>
  </exercise>

  <section|An Imperative Interpreter>

  <\exercise>
    What happens if you remove the \Pgoto\Q line in one of the branches of
    this interpreter? Exactly how does the interpreter fail?

    <\solution*>
      \;

      It returns the return of <verbatim|set!>.
    </solution*>
  </exercise>

  <\exercise>
    Devise examples to illustrate each of the complications mentioned above.

    <\solution*>
      \;

      Comment the \Pgoto\Q line to see what happen.
    </solution*>
  </exercise>

  <\exercise>
    Registerize the interpreter for multiargument procedures (exercise 3.21).

    <\solution*>
      \;

      See source files in folder \Psection-5.3\Q.
    </solution*>
  </exercise>

  <\exercise>
    Convert this interpreter to a trampoline by replacing each call to
    <verbatim|apply-procedure/k> with <verbatim|(set! pc apply-procedure/k)>
    and using a driver that looks like

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (define trampoline

          \ \ (lambda (pc)

          \ \ \ \ (if pc (trampoline (pc)) val)))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      The main code fragment,

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\scm-code>
            (define value-of-pgm

            \ \ (lambda (pgm)

            \ \ \ \ (cases program pgm

            \ \ \ \ \ \ [a-program

            \ \ \ \ \ \ \ (exp1)

            \ \ \ \ \ \ \ (set! exp exp1)

            \ \ \ \ \ \ \ (set! cont (end-cont))

            \ \ \ \ \ \ \ (set! env (init-env))

            \ \ \ \ \ \ \ (trampoline (value-of/k))])))

            \;

            (define pc apply-func/k)

            \;

            (define trampoline

            \ \ (lambda (pc)

            \ \ \ \ (if (procedure? pc)

            \ \ \ \ \ \ \ \ (trampoline (pc))

            \ \ \ \ \ \ \ \ val)))
          </scm-code>
        </cell>>>>
      </wide-tabular>

      \;

      In addition, need to set the return of <em|call-cont>,

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\scm-code>
            [call-cont

            \ (vals rands saved-env saved-cont)

            \ \ \ \ \ \ \ (set! vals (append vals (list val)))

            \ \ \ \ \ \ \ (cond

            \ \ \ \ \ \ \ \ \ [(null? rands)

            \ \ \ \ \ \ \ \ \ \ (set! cont saved-cont)

            \ \ \ \ \ \ \ \ \ \ (set! val (cdr vals))

            \ \ \ \ \ \ \ \ \ \ (set! f-val (expval-\<gtr\>func (car vals)))

            \ \ \ \ \ \ \ \ \ \ apply-func/k]

            \ \ \ \ \ \ \ \ \ [else

            \ \ \ \ \ \ \ \ \ \ ...
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Invent a language feature for which setting the <verbatim|cont> variable
    last requires a temporary variable.

    <\solution*>
      \;

      I think that temporary variable should be used for improving the
      readableness of code, in most coding situation especially Scheme we
      don't have to use any temporary variable, but this will make code
      hulking and need more energy to understand.

      As a example, see source code file \Psection-5.3/evaluation.rkt\Q in
      fragment <verbatim|eval-syntax> \T <verbatim|let-exp> or
      <verbatim|eval-syntax> \T <verbatim|letrec-exp>.
    </solution*>
  </exercise>

  <\exercise>
    Instrument this interpreter as in exercise 5.12. Since continuations are
    represented the same way, reuse that code. Verify that the imperative
    interpreter of this section generates <em|exactly> the same traces as the
    interpreter in exercise 5.12.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Apply the transformation of this section to <verbatim|fact-iter> (page
    139).

    <\solution*>
      \;

      See source code in file \Psection-5.3/fact-iter.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Modify the interpreter of this section so that procedures rely on dynamic
    binding, as in exercise 3.28. As a hint, consider transforming the
    interpreter of exercise 3.28 as we did in this chapter; it will differ
    from the interpreter of this section only for those portions of the
    original interpreter that are different. Instrument the interpreter as in
    exercise 5.28. Observe that just as there is only one continuation in the
    state, there is only one environment that is pushed and popped, and
    furthermore, it is pushed and popped in parallel with the continuation.
    We can conclude that dynamic bindings have <em|dynamic extent>: that is,
    a binding to a formal parameter lasts exactly until that procedure
    returns. This is different from lexical bindings, which can persist
    indefinitely if they wind up in a closure.

    <\solution*>
      \;

      Elided.

      In <verbatim|func> constructor parameters, remove environment. In
      <verbatim|apply-func/k>, use the current environment variable.
    </solution*>
  </exercise>

  <\exercise>
    Eliminate the remaining <verbatim|let> expressions in this code by using
    additional global registers.

    <\solution*>
      \;

      See source code files in folder \Psection-5.3/5.31~5.33\Q, but this is
      not incomplete.
    </solution*>
  </exercise>

  <\exercise>
    Improve your solution to the preceding exercise by minimizing the number
    of global registers used. You can get away with fewer than 5. You may use
    no data structures other than those already used by the interpreter.

    <\solution*>
      \;

      See source code files in folder \Psection-5.3/5.31~5.33\Q, but this is
      not incomplete.
    </solution*>
  </exercise>

  <\exercise>
    Translate the interpreter of this section into an imperative language. Do
    this twice: once using zero-argument procedure calls in the host
    language, and once replacing each zero-argument procedure call by a
    <verbatim|goto>. How do thes \ alternatives perform as the computation
    gets longer?

    <\solution*>
      \;

      See source code files in folder \Psection-5.3/5.31~5.33\Q, but this is
      not incomplete.

      I think this perform is quicker, because this very similar to assembly
      language.
    </solution*>
  </exercise>

  <\exercise>
    As noted on page 157, most imperative languages make it difficult to do
    this translation, because they use the stack for all procedure calls,
    even tail calls. Furthermore, for large interpreters, the pieces of code
    linked by <verbatim|goto>'s may be too large for some compilers to
    handle. Translate the interpreter of this section into an imperative
    language, circumventing this difficulty by using the technique of
    trampolining, as in exercise 5.26.

    <\solution*>
      \;

      I can't solve this exercise for now :(
    </solution*>
  </exercise>

  <section|Exceptions>

  <\exercise>
    This implementation is inefficient, because when an exception is raised,
    <verbatim|apply-handler> must search linearly through the continuation to
    find a handler. Avoid this search by making the <verbatim|try-cont>
    continuation available directly in each continuation.

    <\solution*>
      \;

      See source code files in folder \Psection-5.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    An alternative design that also avoids the linear search in
    <verbatim|apply-handler> is to use two continuations, a normal
    continuation and an exception continuation. Achieve this goal by
    modifying the interpreter of this section to take two continuations
    instead of one.

    <\solution*>
      \;

      See source code files in folder \Psection-5.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Modify the defined language to raise an exception when a procedure is
    called with the wrong number of arguments.

    <\solution*>
      \;

      Host language(interpreter) does this easily, but can defined language
      do this?
    </solution*>
  </exercise>

  <\exercise>
    Modify the defined language to add a division expression. Raise an
    exception on division by zero.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\verbatim-code>
            letrec quotient = proc (a, b)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if =(b, 0)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then raise("divided by
            zero.")

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else if \<less\>(a, b)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 0

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else +(1,
            quotient(-(a,b), b))

            in quotient(13, 0)
          </verbatim-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    So far, an exception handler can propagate the exception by reraising it,
    or it can return a value that becomes the value of the <verbatim|try>
    expression. One might instead design the language to allow the
    computation to resume from the point at which the exception was raised.
    Modify the interpreter of this section to accomplish this by running the
    body of the handler with the continuation from the point at which the
    <verbatim|raise> was invoked.

    <\solution*>
      \;

      Add a new production:

      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-halign|r>|<cwith|1|1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-width|8spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<table|<row|<\cell>
          <em|Expression>
        </cell>|<\cell>
          :=
        </cell>|<\cell>
          <verbatim|resume> <em|Expression>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>|<\cell>
          <\frame>
            resume-exp (exp)
          </frame>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>

      Different from <verbatim|raise-exp>, <verbatim|resume-exp> returns a
      value of <em|Expression>, continues the control context. The fragment
      of <verbatim|value-of/k>,

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\scm-code>
            ...

            [resume-exp (exp1)

            \ (value-of/k exp1 env (resum-cont cont))]

            ...
          </scm-code>
        </cell>>>>
      </wide-tabular>

      The fragment of <verbatim|apply-cont>,

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\scm-code>
            ...

            [resume-cont (saved-cont)

            \ (apply-cont saved-cont val)]

            ...
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Give the exception handlers in the defined language the ability to either
    return or resume. Do this by passing the continuation from the
    <verbatim|raise> exception as a second argument. This may require adding
    continuations as a new kind of expressed value. Devise suitable syntax
    for invoking a continuation on a value.

    <\solution*>
      \;

      See source code files in folder \Psection-5.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    We have shown how to implement exceptions using a data structure
    representation of continuations. We can't immediately apply the recipe of
    section 2.2.3 to get a procedural representation, because we now have two
    observers: <verbatim|apply-handler> and <verbatim|apply-cont>. Implement
    the continuations of this section as a pair of procedures: a one-argument
    procedure representing the action of the continuation under
    <verbatim|apply-cont>, and a zero-argument procedure representing its
    action under <verbatim|apply-handler>.

    <\solution*>
      \;

      See source code file in \Psection-5.4/procedural-cont.rkt\Q, but not
      complete.
    </solution*>
  </exercise>

  <\exercise>
    The preceding exercise captures the continuation only when an exception
    is raised. Add to the language the ability to capture a continuation
    anywhere by adding the form <verbatim|letcc> <em|Identifier>
    <verbatim|in> <em|Expression> with the specification

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (value-of/k (letcc var body) p cont)

          = (value-of/k body (extend-env var cont p) cont)
        </scm-code>
      </cell>>>>
    </wide-tabular>

    Such a captured continuation may be invoked with <verbatim|throw>: the
    expression <verbatim|throw> <em|Expression> <verbatim|to> <em|Expression>
    evaluates the two subexpressions. The second expression should return a
    continuation, which is applied to the value of the first expression. The
    current continuation of the <verbatim|throw> expression is ignored.

    <\solution*>
      \;

      See source code files in folder \Psection-5.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Modify <verbatim|letcc> as defined in the preceding exercise so that the
    captured continuation becomes a new kind of procedure, so instead of
    writing <verbatim|throw> <em|exp1> <verbatim|to> <em|exp2>, one would
    write <verbatim|(exp2 exp1)>.

    <\solution*>
      \;

      See source code files in folder \Psection-5.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    An alternative to <verbatim|letcc> and <verbatim|throw> of the preceding
    exercises is to add a single procedure to the language. This procedure,
    which in Scheme is called <verbatim|call-with-current-continuation>,
    takes a one-argument procedure, <verbatim|p>, and passes to <verbatim|p>
    a procedure that when invoked with one argument, passes that argument to
    the current continuation, <verbatim|cont>. We could define
    <verbatim|call-with-current-continuation> in terms of <verbatim|letcc>
    and <verbatim|throw> as follows:

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let call-with-current-continuation

          \ \ \ \ \ \ = proc (p)

          \ \ \ \ \ \ \ \ \ \ letcc cont

          \ \ \ \ \ \ \ \ \ \ in (p proc (v) throw v to cont)

          in ...
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    Add <verbatim|call-with-current-continuation> to the language. Then write
    a translator that takes the language with <verbatim|letcc> and
    <verbatim|throw> and translates it into the language without letcc and
    throw, but with <verbatim|call-with-current-continuation>.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <section|Threads>

  <\exercise>
    Add to the language of this section a construct called <verbatim|yield>.
    Whenever a thread executes a <verbatim|yield>, it is placed on the ready
    queue, and the thread at the head of the ready queue is run. When the
    thread is resumed, it should appear as if the call to <verbatim|yield>
    had returned the number 99.

    <\solution*>
      \;

      See source code files in folder \Psection-5.5\Q.

      I have changed <verbatim|spawn> expression to <verbatim|yield>.
    </solution*>
  </exercise>

  <\exercise>
    In the system of exercise 5.45, a thread may be placed on the ready queue
    either because its time slot has been exhausted or because it chose to
    yield. In the latter case, it will be restarted with a full time slice.
    Modify the system so that the ready queue keeps track of the remaining
    time slice (if any) of each thread, and restarts the thread only with the
    time it has remaining.

    <\solution*>
      \;

      See source code files in folder \Psection-5.5/scheduler.rkt \T
      <verbatim|run-next-thread>\Q.
    </solution*>
  </exercise>

  <\exercise>
    What happens if we are left with two subthreads, each waiting for a mutex
    held by the other subthread?

    <\solution*>
      \;

      These two subthreads mutually locked.
    </solution*>
  </exercise>

  <\exercise>
    We have used a procedural representation of threads. Replace this by a
    data-structure representation.

    <\solution*>
      \;

      See source code in file \Psection-5.5/5.48.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Do exercise 5.15 (continuations as a stack of frames) for THREADS.

    <\solution*>
      \;

      See source code in file \Psection-5.5/scheduler.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Registerize the interpreter of this section. What is the set of mutually
    tail-recursive procedures that must be registerized?

    <\solution*>
      \;

      See source code in file \Psection-5.5/evaluation.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    We would like to be able to organize our program so that the consumer in
    figure 5.17 doesn't have to busy-wait. Instead, it should be able to put
    itself to sleep and be awakened when the producer has put a value in the
    buffer. Either write a program with mutexes to do this, or implement a
    synchronization operator that makes this possible.

    <\solution*>
      \;

      This problem can be solved by <verbatim|mutex> and
      <verbatim|wait-end>(next exercise).

      <\enumerate-numeric>
        <item><em|before, after> in main thread, orderly executed.

        <item><em|before, after> in different subthreads, ensured spawning
        <em|before>'s subthread before <em|after>'s, then used
        <verbatim|mutex>.

        <item><em|before> in main thread, <em|after> in subthread, ensured
        spawing <em|after>'s subthread after <em|before>.

        <item><em|before> in subthread, <em|after> in main thread, used
        <verbatim|wait-end>.
      </enumerate-numeric>
    </solution*>
  </exercise>

  <\exercise>
    Write a program using mutexes that will be like the program in figure
    5.21, except that the main thread waits for all three of the subthreads
    to terminate, and then returns the value of <verbatim|x>.

    <\solution*>
      \;

      See source code files in folder \Psection-5.5\Q.
    </solution*>
  </exercise>

  <\exercise>
    Modify the thread package to include thread identifiers. Each new thread
    is associated with a fresh thread identifier. When the child thread is
    spawned, it is passed its thread identifier as a value, rather than the
    arbitrary value 28 used in this section. The child's number is also
    returned to the parent as the value of the spawn expression. Instrument
    the interpreter to trace the creation of thread identifiers. Check to see
    that the ready queue contains at most one thread for each thread
    identifier. How can a child thread know its parent's identifier? What
    should be done about the thread identifier of the original program?

    <\solution*>
      \;

      See source code files in folder \Psection-5.5/5.33~5.56\Q, but not
      complete.
    </solution*>
  </exercise>

  <\exercise>
    Add to the interpreter of exercise 5.53 a kill facility. The kill
    construct, when given a thread number, finds the corresponding thread on
    the ready queue or any of the waiting queues and removes it. In addition,
    kill should return a true value if the target thread is found and false
    if the thread number is not found on any queue.

    <\solution*>
      \;

      See source code files in folder \Psection-5.5/5.33~5.56\Q, but not
      complete.
    </solution*>
  </exercise>

  <\exercise>
    Add to the interpreter of exercise 5.53 an interthread communication
    facility, in which each thread can send a value to another thread using
    its thread identifier. A thread can receive messages when it chooses,
    blocking if no message has been sent to it.

    <\solution*>
      \;

      See source code files in folder \Psection-5.5/5.33~5.56\Q, but not
      complete.
    </solution*>
  </exercise>

  <\exercise>
    Modify the interpreter of exercise 5.55 so that rather than sharing a
    store, each thread has its own store. In such a language, mutexes can
    almost always be avoided. Rewrite the example of this section in this
    language, without using mutexes.

    <\solution*>
      \;

      See source code files in folder \Psection-5.5/5.33~5.56\Q, but not
      complete.
    </solution*>
  </exercise>

  <\exercise>
    There are lots of different synchronization mechanisms in your favorite
    OS book. Pick three and implement them in this framework.

    <\solution*>
      \;

      Elided.

      I haven't read any OS books yet :)
    </solution*>
  </exercise>

  <\exercise>
    Go off with your friends and have some pizza, but make sure only one
    person at a time grabs a piece!

    <\solution*>
      \;

      I have a pizza only myself, but I can grab a piece by one hand at a
      time.
    </solution*>
  </exercise>

  <chapter|Continuation-Passing Style>

  <section|Writing Programs in Continuation-Passing Style>

  <\exercise>
    Consider figure 6.2 without <verbatim|(set! pc fact/k)> in the definition
    of <verbatim|fact/k> and without <verbatim|(set! pc apply-cont)> in the
    definition of <verbatim|apply-cont>. Why does the program still work?

    <\solution*>
      \;

      Calling-chain not changed.
    </solution*>
  </exercise>

  <\exercise>
    Prove by induction on n that for any <verbatim|g>, <verbatim|(fib/k n g)
    = (g (fib n))>.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\scm-code>
            (fib/k (+ n 1) g)

            = (fib/k n (lambda (v1) (fib/k (- n 1)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (lambda
            (v2) (g (+ v1 v2))))))

            = ((lambda (v1) (fib/k (- n 1) (lambda (v2) (g (+ v1 v2)))))

            \ \ \ (fib/k n))

            = (fib/k (- n 1) (lambda (v2) (g (+ (fib/k n) v2))))

            = ((lambda (v2) (g (+ (fib/k n) v2)))

            \ \ \ (fib/k (- n 1))

            =(g (+ (fib/k n) (fib/k (- n 1))))

            =(g (fib (+ n 1)))
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Rewrite each of the following Scheme expressions in continuationpassing
    style. Assume that any unknown functions have also been rewritten in CPS.

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-bsep|3sep>|<cwith|1|-1|1|-1|cell-tsep|3sep>|<table|<row|<\cell>
        1.
      </cell>|<\cell>
        <\scm-code>
          (lambda (x y) (p (+ 8 x) (q y)))
        </scm-code>
      </cell>>|<row|<\cell>
        2.
      </cell>|<\cell>
        <\scm-code>
          (lambda (x y u v) (+ 1 (f (g x y) (+ u v))))
        </scm-code>
      </cell>>|<row|<\cell>
        3.
      </cell>|<\cell>
        <\scm-code>
          (+ 1 (f (g x y) (+ u (h v))))
        </scm-code>
      </cell>>|<row|<\cell>
        4.
      </cell>|<\cell>
        <\scm-code>
          (zero? (if a (p x) (p y)))
        </scm-code>
      </cell>>|<row|<\cell>
        5.
      </cell>|<\cell>
        <\scm-code>
          (zero? (if (f a) (p x) (p y)))
        </scm-code>
      </cell>>|<row|<\cell>
        6.
      </cell>|<\cell>
        <\scm-code>
          (let ((x (let ((y 8)) (p y)))) x)
        </scm-code>
      </cell>>|<row|<\cell>
        7.
      </cell>|<\cell>
        <\scm-code>
          (let ((x (if a (p x) (p y)))) x)
        </scm-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|6spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-tsep|4sep>|<cwith|1|-1|1|-1|cell-bsep|4sep>|<table|<row|<\cell>
          1.
        </cell>|<\cell>
          <\scm-code>
            (lambda (x y cont)

            \ \ (q y (lambda (v1)

            \ \ \ \ \ \ \ \ \ (p (+ 8 x) v1 cont))))
          </scm-code>
        </cell>>|<row|<\cell>
          2.
        </cell>|<\cell>
          <\scm-code>
            (lambda (x y u v cont)

            \ \ (g x y (lambda (v1)

            \ \ \ \ \ \ \ \ \ \ \ (f v1 (+ u v) (lambda (v2)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (cont (+ 1
            v2)))))))
          </scm-code>
        </cell>>|<row|<\cell>
          3.
        </cell>|<\cell>
          <\scm-code>
            (define end (lambda (val) val))

            \;

            (h v (lambda (v1)

            \ \ \ \ \ \ \ (g x y (lambda v2)

            \ \ \ \ \ \ \ \ \ \ (f v2 (+ u v1) (lambda (v3)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (end (+ 1
            v3)))))))
          </scm-code>
        </cell>>|<row|<\cell>
          4.
        </cell>|<\cell>
          <\scm-code>
            (zero? (if a (p x end) (p y end)))
          </scm-code>
        </cell>>|<row|<\cell>
          5.
        </cell>|<\cell>
          <\scm-code>
            (f a (lambda (v1)

            \ \ \ \ \ \ \ (zero? (if v1 (p x end) (p y end)))))
          </scm-code>
        </cell>>|<row|<\cell>
          6.
        </cell>|<\cell>
          <\scm-code>
            (let ([y 8])

            \ \ (p y (lambda (v1)

            \ \ \ \ \ \ \ \ \ (let ([x v1]) (end x)))))
          </scm-code>
        </cell>>|<row|<\cell>
          7.
        </cell>|<\cell>
          <\scm-code>
            (let ([x (if a (p x end) (p y end)))) x)
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Rewrite each of the following procedures in continuation-passing style.
    For each procedure, do this first using a data-structure representation
    of continuations, then with a procedural representation, and then with
    the inlined procedural representation. Last, write the registerized
    version. For each of these four versions, test to see that your
    implementation is tail-recursive by defining <verbatim|end-cont> by

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (apply-cont (end-cont) val)

          = (begin

          \ \ \ \ (eopl:printf ``End of computation.~%")

          \ \ \ \ (eopl:printf ``This sentence should appear only once.~%")

          \ \ \ \ val)
        </scm-code>
      </cell>>>>
    </wide-tabular>

    as we did in chapter 5.

    <\enumerate-numeric>
      <item><verbatim|remove-first> (section 1.2.3).

      <item><verbatim|list-sum> (section 1.3).

      <item><verbatim|occurs-free?> (section 1.2.4).

      <item><verbatim|subst> (section 1.2.5).
    </enumerate-numeric>

    <\solution*>
      \;

      See source code files in folder \Psection-6.1/6.4\Q. Elided
      data-structuer representation.
    </solution*>
  </exercise>

  <\exercise>
    When we rewrite an expression in CPS, we choose an evaluation order for
    the procedure calls in the expression. Rewrite each of the preceding
    examples in CPS so that all the procedure calls are evaluated from right
    to left.

    <\solution*>
      \;

      See source code files in folder \Psection-6.1/6.5\Q.
    </solution*>
  </exercise>

  <\exercise>
    How many different evaluation orders are possible for the procedure calls
    in <verbatim|(lambda (x y) (+ (f (g x)) (h (j y))))>? For each evaluation
    order, write a CPS expression that calls the procedures in that order.

    <\solution*>
      \;

      About 4.
    </solution*>
  </exercise>

  <\exercise>
    Write out the procedural and the inlined representations for the
    interpreter in figures 5.4, 5.5, and 5.6.

    <\solution*>
      \;

      See source code in file \Psection-6.1/6.7.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Rewrite the interpreter of section 5.4 using a procedural and inlined
    representation. This is challenging because we effectively have two
    observers, <verbatim|apply-cont> and <verbatim|apply-handler>. As a hint,
    consider modifying the recipe on page 6.1 so that we add to each
    procedure two extra arguments, one representing the behavior of the
    continuation under <verbatim|apply-cont> and one representing its
    behavior under <verbatim|apply-handler>.

    <\solution*>
      \;

      See source code in file \Psection-6.1/6.8.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    What property of multiplication makes this program optimization possible?

    <\solution*>
      \;

      It can accumulate returned values into a argument.
    </solution*>
  </exercise>

  <\exercise>
    For <verbatim|list-sum>, formulate a succinct representation of the
    continuations, like the one for <verbatim|fact/k> above.

    <\solution*>
      \;

      See source code in file \Psection-6.1/6.10.rkt\Q.
    </solution*>
  </exercise>

  <section|Tail Form>

  <\exercise>
    Complete the interpreter of figure 6.6 by writing
    <verbatim|value-of-simple-exp>.

    <\solution*>
      \;

      See source code in file \Psection-6.2/evaluation.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Determine whether each of the following expressions is simple.

    <\enumerate-numeric>
      <item><verbatim|-((f -(x,1)),1)>

      <item><verbatim|(f -(-(x,y),1))>

      <item><verbatim|if zero?(x) then -(x,y) else -(-(x,y),1)>

      <item><verbatim|let x = proc (y) (y x) in -(x,3)>

      <item><verbatim|let f = proc (x) x in (f 3)>
    </enumerate-numeric>

    <\solution*>
      \;

      <\enumerate-numeric>
        <item>no

        <item>yes

        <item>yes

        <item>no

        <item>yes
      </enumerate-numeric>
    </solution*>
  </exercise>

  <\exercise>
    Translate each of these expressions in CPS-IN into continuationpassing
    style using the CPS recipe on page 200 above. Test your transformed
    programs by running them using the interpreter of figure 6.6. Be sure
    that the original and transformed versions give the same answer on each
    input.

    <\enumerate-numeric>
      <item><verbatim|removeall>.

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|8spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\verbatim-code>
            letrec

            \ \ removeall(n,s) =

            \ \ \ \ if null?(s)

            \ \ \ \ then emptylist

            \ \ \ \ else if number?(car(s))

            \ \ \ \ \ \ \ \ \ then if equal?(n,car(s))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ then (removeall n cdr(s))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ else cons(car(s),(removeall n
            cdr(s)))

            \ \ \ \ \ \ \ \ \ else cons((removeall n car(s)),

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (removeall n cdr(s)))
          </verbatim-code>
        </cell>>>>
      </wide-tabular>

      <item><verbatim|occurs-in?>.

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|8spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\verbatim-code>
            letrec

            \ \ occurs-in?(n,s) =

            \ \ \ \ if null?(s)

            \ \ \ \ then 0

            \ \ \ \ else if number?(car(s))

            \ \ \ \ \ \ \ \ \ then if equal?(n,car(s))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 1

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ else (occurs-in? n cdr(s))

            \ \ \ \ \ \ \ \ \ else if (occurs-in? n car(s))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 1

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ else (occurs-in? n cdr(s))
          </verbatim-code>
        </cell>>>>
      </wide-tabular>

      <item><verbatim|remfirst>. This uses <verbatim|occurs-in?> from the
      preceding example.

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|8spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\verbatim-code>
            letrec

            \ \ remfirst(n,s) =

            \ \ \ \ letrec

            \ \ \ \ \ \ loop(s) =

            \ \ \ \ \ \ \ \ if null?(s)

            \ \ \ \ \ \ \ \ then emptylist

            \ \ \ \ \ \ \ \ else if number?(car(s))

            \ \ \ \ \ \ \ \ \ \ \ \ \ then if equal?(n,car(s))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then cdr(s)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else cons(car(s),(loop
            cdr(s)))

            \ \ \ \ \ \ \ \ \ \ \ \ \ else if (occurs-in? n car(s))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then cons((remfirst n
            car(s)),cdr(s))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else cons(car(s),(remfirst n
            cdr(s)))

            in (loop s)
          </verbatim-code>
        </cell>>>>
      </wide-tabular>

      <item><verbatim|depth>.

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|8spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\verbatim-code>
            letrec

            \ \ depth(s) =

            \ \ \ \ if null?(s)

            \ \ \ \ then 1

            \ \ \ \ else if number?(car(s))

            \ \ \ \ \ \ \ \ \ then (depth cdr(s))

            \ \ \ \ \ \ \ \ \ else if less?(add1((depth car(s))),

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (depth
            cdr(s)))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ then (depth cdr(s))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ else add1((depth car(s)))
          </verbatim-code>
        </cell>>>>
      </wide-tabular>

      <item><verbatim|depth-with-let>.

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|8spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\verbatim-code>
            letrec

            \ \ depth(s) =

            \ \ \ \ if null?(s)

            \ \ \ \ then 1

            \ \ \ \ else if number?(car(s))

            \ \ \ \ \ \ \ \ \ then (depth cdr(s))

            \ \ \ \ \ \ \ \ \ else let dfirst = add1((depth car(s)))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ drest = (depth cdr(s))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ in if less?(dfirst,drest)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then drest

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else dfirst
          </verbatim-code>
        </cell>>>>
      </wide-tabular>

      <item><verbatim|map>.

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|8spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\verbatim-code>
            letrec

            \ \ map(f, l) = if null?(l)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ then emptylist

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ else cons((f car(l)),(map f cdr(l)))

            \ \ square(n) = *(n,n)

            in (map square list(1,2,3,4,5))
          </verbatim-code>
        </cell>>>>
      </wide-tabular>

      <item><verbatim|fnlrgtn>. This procedure takes an n-list, like an
      s-list (page 9), but with number instead of symbols, and a number
      <verbatim|n> and returns the first number in the list (in leftto-right
      order) that is greater than <verbatim|n>. Once the result is found, no
      further elements in the list are examined. For example,

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|8spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\verbatim-code>
            (fnlrgtn list(1,list(3,list(2),7,list(9)))

            \ 6)
          </verbatim-code>
        </cell>>>>
      </wide-tabular>

      finds 7.

      <item><verbatim|every>. This procedure takes a predicate and a list and
      returns a true value if and only if the predicate holds for each list
      element.

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|8spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|4sep>|<cwith|1|1|2|2|cell-tsep|4sep>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\verbatim-code>
            letrec

            \ \ every(pred, l) =

            \ \ \ \ if null?(l)

            \ \ \ \ then 1

            \ \ \ \ else if (pred car(l))

            \ \ \ \ \ \ \ \ \ then (every pred cdr(l))

            \ \ \ \ \ \ \ \ \ else 0

            in (every proc(n)greater?(n,5) list(6,7,8,9))
          </verbatim-code>
        </cell>>>>
      </wide-tabular>
    </enumerate-numeric>

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Complete the interpreter of figure 6.6 by supplying definitions for
    <verbatim|value-of-program> and <verbatim|apply-cont>.

    <\solution*>
      \;

      See source code in file \Psection-6.2/evaluation.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Observe that in the interpreter of the preceding exercise, there is only
    one possible value for <verbatim|cont>. Use this observation to remove
    the <verbatim|cont> argument entirely.

    <\solution*>
      \;

      See source code in file \Psection-6.2/evaluation.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Registerize the interpreter of figure 6.6.

    <\solution*>
      \;

      See source code in file \Psection-6.2/evaluation.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Trampoline the interpreter of figure 6.6.

    <\solution*>
      \;

      See source code in file \Psection-6.2/evaluation.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Modify the grammar of CPS-OUT so that a simple <verbatim|diff-exp> or
    <verbatim|zero?-exp> can have only a constant or variable as an argument.
    Thus in the resulting language <verbatim|value-of-simple-exp> can be made
    nonrecursive.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Write a Scheme procedure <verbatim|tail-form?> that takes the syntax tree
    of a program in CPS-IN, expressed in the grammar of figure 6.3, and
    determines whether the same string would be in tail form according to the
    grammar of figure 6.5.

    <\solution*>
      \;

      See source code in file \Psection-6.2/tail-form.rkt\Q.
    </solution*>
  </exercise>

  <section|Converting to Continuation-Passing Style>

  <\exercise>
    Our procedure <verbatim|cps-of-exps> causes subexpressions to be
    evaluated from left to right. Modify <verbatim|cps-of-exps> so that
    subexpressions are evaluated from right to left.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\scm-code>
            ...

            (let ([pos (list-index (lambda (exp)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (not
            (simple-exp? exp)))

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (reverse
            exps))])

            ...
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Modify <verbatim|cps-of-call-exp> so that the operands are evaluated from
    left to right, followed by the operator.

    <\solution*>
      \;

      No need to modify, see source code in folder \Psection-6.3\Q.
    </solution*>
  </exercise>

  <\exercise>
    Sometimes, when we generate <em|(K simp)>, <em|K> is already a
    <verbatim|proc-exp<strong|>>. So instead of generating

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          (proc (var1) ... simp)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    we could generate

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let var1 = simp

          in ...
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    This leads to CPS code with the property that it never contains a
    subexpression of the form

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          (proc (var) exp1

          \ simp)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    unless that subexpression was in the original expression.

    Modify make-send-to-cont to generate this better code. When does the new
    rule apply?

    <\solution*>
      \;

      See source code in file \Psection-6.3/cps-of.rkt \T
      <verbatim|make-send-to-cont>\Q.
    </solution*>
  </exercise>

  <\exercise>
    Observe that our rule for <verbatim|if> makes two copies of the
    continuation <em|K>, so in a nested <verbatim|if> the size of the
    transformed program can grow exponentially. Run an example to confirm
    this observation. Then show how this may be avoided by changing the
    transformation to bind a fresh variable to <em|K>.

    <\solution*>
      \;

      See source code in file \Psection-6.3/cps-of.rkt \T
      <verbatim|cps-of-exp> \T <verbatim|if-exp>\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add lists to the language (exercise 3.10). Remember that the arguments to
    a list are not in tail position.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Extend CPS-IN so that a <verbatim|let> expression can declare an
    arbitrary number of variables (exercise 3.16).

    <\solution*>
      \;

      See soure code in file \Psection-6.3/cps-of.rkt \T
      <verbatim|cps-of-exp> \T <verbatim|let-exp>\Q.
    </solution*>
  </exercise>

  <\exercise>
    A continuation variable introduced by <verbatim|cps-of-exps> will only
    occur once in the continuation. Modify <verbatim|make-send-to-cont> so
    that instead of generating

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let var1 = simp1

          in T
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    as in exercise 6.22, it generates <em|T[simp1/var1]>, where the notation
    <em|E1[E2/var]> means expression E1 with every free occurrence of the
    variable var replaced by E2.

    <\solution*>
      \;

      If I understand this correctly, it havd been solved in exercise 6.22.
    </solution*>
  </exercise>

  <\exercise>
    As it stands, <verbatim|cps-of-let-exp >will generate a useless
    <verbatim|let> expression. (Why?) Modify this procedure so that the
    continuation variable is the same as the <verbatim|let> variable. Then if
    <em|exp1> is nonsimple,

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          (cps-of-exp \<less\>\<less\>let var1 = exp1 in exp2\<gtr\>\<gtr\>
          K)

          = (cps-of-exp exp1 \<less\>\<less\>proc (var1) (cps-of-exp exp2
          K)\<gtr\>\<gtr\>
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      Elided.

      <verbatim|let-exp> and <verbatim|letrec-exp> are very similar to

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <\scm-code>
            ((lambda (var1 var2)

            \ \ \ body)

            \ exp1

            \ exp2)
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Food for thought: imagine a CPS transformer for Scheme programs, and
    imagine that you apply it to the first interpreter from chapter 3. What
    would the result look like?

    <\solution*>
      \;

      My interpreter interprets the code of Scheme-like, if do this
      correctly, no doubt, it will procduct same value.
    </solution*>
  </exercise>

  <\exercise>
    Consider this variant of <verbatim|cps-of-exps>.

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (define cps-of-exps

          \ \ (lambda (exps builder)

          \ \ \ \ (let cps-of-rest ((exps exps) (acc '()))

          \ ;; cps-of-rest : Listof(InpExp) \<times\> Listof(SimpleExp)
          \<rightarrow\> TfExp

          \ \ \ \ \ \ (cond

          \ \ \ \ \ \ \ \ ((null? exps) (builder (reverse acc)))

          \ \ \ \ \ \ \ \ ((inp-exp-simple? (car exps))

          \ \ \ \ \ \ \ \ \ (cps-of-rest

          \ \ \ \ \ \ \ \ \ \ (cdr exps)

          \ \ \ \ \ \ \ \ \ \ (cons (cps-of-simple-exp (car exps)) acc)))

          \ \ \ \ \ \ \ \ (else

          \ \ \ \ \ \ \ \ \ (let ((var (fresh-identifier 'var)))

          \ \ \ \ \ \ \ \ \ \ \ (cps-of-exp

          \ \ \ \ \ \ \ \ \ \ \ \ (car exps)

          \ \ \ \ \ \ \ \ \ \ \ \ (cps-proc-exp

          \ \ \ \ \ \ \ \ \ \ \ \ \ (list var)

          \ \ \ \ \ \ \ \ \ \ \ \ \ (cps-of-rest (cdr exps)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (cons

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (cps-of-simple-exp
          (var-exp var))

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ acc))))))))))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    Why is this variant of <verbatim|cps-of-exp> more efficient than the one
    in figure 6.8?

    <\solution*>
      \;

      No need <verbatim|list-index> to test simple-exp.
    </solution*>
  </exercise>

  <\exercise>
    A call to <verbatim|cps-of-exps> with a list of expressions of length one
    can be simplified as follows:

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          (cps-of-exps (list exp) builder)

          = (cps-of-exp/ctx exp (lambda (simp) (builder (list simp))))
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    where

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <strong|cps-of-exp/ctx> : <em|InpExp \<times\> (SimpleExp
        \<rightarrow\> TfExp) \<rightarrow\> TfExp>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (define cps-of-exp/ctx

          \ \ (lambda (exp context)

          \ \ \ \ (if (inp-exp-simple? exp)

          \ \ \ \ \ \ \ \ (context (cps-of-simple-exp exp))

          \ \ \ \ \ \ \ \ (let ((var (fresh-identifier 'var)))

          \ \ \ \ \ \ \ \ \ \ (cps-of-exp exp

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (cps-proc-exp (list
          var)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (context
          (cps-var-exp var))))))))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    Thus, we can simplify occurrences of <verbatim|(cps-of-exps (list ...))>,
    since the number of arguments to list is known. Therefore the definition
    of, for example, <verbatim|cps-of-diff-exp> could be defined with
    <verbatim|cps-of-exp/ctx> instead of with <verbatim|cps-of-exps>.

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (define cps-of-diff-exp

          \ \ (lambda (exp1 exp2 k-exp)

          \ \ \ \ (cps-of-exp/ctx

          \ \ \ \ \ exp1

          \ \ \ \ \ (lambda (simp1)

          \ \ \ \ \ \ \ (cps-of-exp/ctx

          \ \ \ \ \ \ \ \ exp2

          \ \ \ \ \ \ \ \ (lambda (simp2)

          \ \ \ \ \ \ \ \ \ \ (make-send-to-cont

          \ \ \ \ \ \ \ \ \ \ \ k-exp

          \ \ \ \ \ \ \ \ \ \ \ (cps-diff-exp simp1 simp2))))))))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    For the use of <verbatim|cps-of-exps> in <verbatim|cps-of-call-exp>, we
    can use <verbatim|cps-of-exp/ctx> on the <verbatim|rator>, but we still
    need <verbatim|cps-of-exps> for the <verbatim|rands>. Remove all other
    occurrences of <verbatim|cps-of-exps> from the translator.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Write a translator that takes the output of <verbatim|cps-of-program> and
    produces an equivalent program in which all the continuations are
    represented by data structures, as in chapter 5. Represent data
    structures like those constructed using <verbatim|define-datatype> as
    lists. Since our language does not have symbols, you can use an integer
    tag in the car position to distinguish the variants of a data type.

    <\solution*>
      \;

      See source code in file \Psection-6.3/maybe-bad.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Write a translator like the one in exercise 6.31, except that it
    represents all procedures by data structures.

    <\solution*>
      \;

      See source code in file \Psection-6.3/maybe-bad.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Write a translator that takes the output from exercise 6.32 and converts
    it to a register program like the one in figure 6.1.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    When we convert a program to CPS, we do more than produce a program in
    which the control contexts become explicit. We also choose the exact
    order in which the operations are done, and choose names for each
    intermediate result. The latter is called <em|sequentialization>. If we
    don't care about obtaining iterative behavior, we can sequentialize a
    program by converting it to <em|A-normal> form or <em|ANF>. Here's an
    example of a program in ANF.

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (define fib/anf

          \ \ (lambda (n)

          \ \ \ \ (if (\<less\> n 2)

          \ \ \ \ \ \ \ \ 1

          \ \ \ \ \ \ \ \ (let ((val1 (fib/anf (- n 1))))

          \ \ \ \ \ \ \ \ \ \ (let ((val2 (fib/anf (- n 2))))

          \ \ \ \ \ \ \ \ \ \ \ \ (+ val1 val2))))))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    Whereas a program in CPS sequentializes computation by passing
    continuations that name intermediate results, a program in ANF
    sequentializes computation by using let expressions that name all of the
    intermediate results.

    Retarget <verbatim|cps-of-exp> so that it generates programs in ANF
    instead of CPS. (For conditional expressions occurring in nontail
    position, use the ideas in exercise 6.23.)Then, show that applying the
    revised <verbatim|cps-of-exp> to, e.g., the definition of <verbatim|fib>
    yields the definition of <verbatim|fib/anf>. Finally, show that given an
    input program which is already in ANF, your translator produces the same
    program except for the names of bound variables.

    <\solution*>
      \;

      See source code in file \Psection-6.3/anf-of.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Verify on a few examples that if the optimization of exercise 6.27 is
    installed, CPS-transforming the output of your ANF transformer (exercise
    6.34) on a program yields the same result as CPS-transforming the
    program.

    <\solution*>
      \;

      See source code example in file \Psection-6.3/test.rkt\Q.
    </solution*>
  </exercise>

  <section|Modeling Computational Effects>

  <\exercise>
    Add a <verbatim|begin> expression (exercise 4.4) to CPS-IN. You should
    not need to add anything to CPS-OUT.

    <\solution*>
      \;

      See source code in folder \Psection-6.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add implicit references (section 4.3) to CPS-IN. Use the same version of
    CPS-OUT, with explicit references, and make sure your translator inserts
    allocation and dereference where necessary. As a hint, recall that in the
    presence of implicit references, a var-exp is no longer simple, since it
    reads from the store.

    <\solution*>
      \;

      See source code in folder \Psection-6.4\Q.

      I used some different way to impletment this.
    </solution*>
  </exercise>

  <\exercise>
    If a variable never appears on the left-hand side of a set expression,
    then it is immutable, and could be treated as simple. Extend your
    solution to the preceding exercise so that all such variables are treated
    as simple.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Implement <verbatim|letcc> and <verbatim|throw> in the CPS translator.

    <\solution*>
      \;

      See source code in folder \Psection-6.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Implement <verbatim|try/catch> and throw from section 5.4 by adding them
    to the CPS translator. You should not need to add anything to CPS-OUT.
    Instead, modify <verbatim|cps-of-exp> to take two continuations: a
    success continuation and an error continuation.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <chapter|Types>

  <section|Values and Their Types>

  <\exercise>
    Below is a list of closed expressions. Consider the value of each
    expression. For each value, what type or types does it have? Some of the
    values may have no type that is describable in our type language.

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|6spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-bsep|3sep>|<cwith|1|-1|1|-1|cell-tsep|3sep>|<cwith|1|-1|1|1|cell-halign|r>|<table|<row|<\cell>
        1.
      </cell>|<\cell>
        <verbatim|proc (x) -(x,3)>
      </cell>>|<row|<\cell>
        2.
      </cell>|<\cell>
        <verbatim|proc (f) proc (x) -((f x), 1)>
      </cell>>|<row|<\cell>
        3.
      </cell>|<\cell>
        <verbatim|proc (x) x>
      </cell>>|<row|<\cell>
        4.
      </cell>|<\cell>
        <verbatim|proc (x) proc (y) (x y)>
      </cell>>|<row|<\cell>
        5.
      </cell>|<\cell>
        <verbatim|proc (x) (x 3)>
      </cell>>|<row|<\cell>
        6.
      </cell>|<\cell>
        <verbatim|proc (x) (x x)>
      </cell>>|<row|<\cell>
        7.
      </cell>|<\cell>
        <verbatim|proc (x) if x then 88 else 99>
      </cell>>|<row|<\cell>
        8.
      </cell>|<\cell>
        <verbatim|proc (x) proc (y) if x then y else 99>
      </cell>>|<row|<\cell>
        9.
      </cell>|<\cell>
        <\verbatim-code>
          (proc (p) if p then 88 else 99

          \ \ 33)
        </verbatim-code>
      </cell>>|<row|<\cell>
        10.
      </cell>|<\cell>
        <\verbatim-code>
          (proc (p) if p then 88 else 99

          \ \ proc (z) z)
        </verbatim-code>
      </cell>>|<row|<\cell>
        11.
      </cell>|<\cell>
        <\verbatim-code>
          proc (f)

          \ proc (g)

          \ \ proc (p)

          \ \ \ proc (x)

          \ \ \ \ if (p (f x)) then (g 1) else -((f x),1)
        </verbatim-code>
      </cell>>|<row|<\cell>
        12.
      </cell>|<\cell>
        <\verbatim-code>
          proc (x)

          \ proc(p)

          \ \ proc (f)

          \ \ \ if (p x) then -(x,1) else (f p)
        </verbatim-code>
      </cell>>|<row|<\cell>
        13.
      </cell>|<\cell>
        <\verbatim-code>
          proc (f)

          \ let d = proc (x)

          \ \ \ \ \ \ \ \ \ \ proc (z)

          \ \ \ \ \ \ \ \ \ \ \ ((f (x x)) z)

          \ in proc (n)

          \ \ \ \ \ ((f (d d)) n)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-width|6spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-bsep|3sep>|<cwith|1|-1|1|-1|cell-tsep|3sep>|<cwith|1|-1|1|1|cell-halign|r>|<table|<row|<\cell>
          1.
        </cell>|<\cell>
          <verbatim|(int -\<gtr\> int)>
        </cell>>|<row|<\cell>
          2.
        </cell>|<\cell>
          <verbatim|((t -\<gtr\> int) -\<gtr\> (t -\<gtr\> int))>
        </cell>>|<row|<\cell>
          3.
        </cell>|<\cell>
          <verbatim|(t -\<gtr\> t)>
        </cell>>|<row|<\cell>
          4.
        </cell>|<\cell>
          <verbatim|((t -\<gtr\> t) -\<gtr\> (t -\<gtr\> t))>
        </cell>>|<row|<\cell>
          5.
        </cell>|<\cell>
          <verbatim|((int -\<gtr\> t) -\<gtr\> t)>
        </cell>>|<row|<\cell>
          6.
        </cell>|<\cell>
          <verbatim|((p -\<gtr\> t) -\<gtr\> t)>, recursive in <verbatim|p>,
          no type.
        </cell>>|<row|<\cell>
          7.
        </cell>|<\cell>
          <verbatim|(bool -\<gtr\> int)>
        </cell>>|<row|<\cell>
          8.
        </cell>|<\cell>
          <verbatim|(bool -\<gtr\> (int -\<gtr\> int))>
        </cell>>|<row|<\cell>
          9.
        </cell>|<\cell>
          <verbatim|(bool -\<gtr\> int)>, but wrong argument type
          <verbatim|int>.
        </cell>>|<row|<\cell>
          10.
        </cell>|<\cell>
          <verbatim|(bool -\<gtr\> int)>, but wrong argument type
          <verbatim|(t -\<gtr\> t)>.
        </cell>>|<row|<\cell>
          11.
        </cell>|<\cell>
          <\verbatim-code>
            ((t -\<gtr\> int)

            \ \ -\<gtr\> ((int -\<gtr\> int)

            \ \ \ \ \ \ \ -\<gtr\> ((int -\<gtr\> bool)

            \ \ \ \ \ \ \ \ \ \ \ \ -\<gtr\> (t -\<gtr\> int))))
          </verbatim-code>
        </cell>>|<row|<\cell>
          12.
        </cell>|<\cell>
          <verbatim|(int -\<gtr\> ((int -\<gtr\> bool) -\<gtr\> (((int
          -\<gtr\> bool) -\<gtr\> int) -\<gtr\> int)))>
        </cell>>|<row|<\cell>
          13.
        </cell>|<\cell>
          <verbatim|((t -\<gtr\> (t -\<gtr\> t)) -\<gtr\> (t -\<gtr\> t))>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Are there any expressed values that have exactly two types according to
    definition 7.1.1?

    <\solution*>
      \;

      No.
    </solution*>
  </exercise>

  <\exercise>
    For the language LETREC, is it decidable whether an expressed value val
    is of type <em|t>?

    <\solution*>
      \;

      Yes.
    </solution*>
  </exercise>

  <section|Assigning a Type to an Expression>

  <\exercise>
    Using the rules of this section, write derivations, like the one on page
    5, that assign types for <verbatim|proc (x) x> and <verbatim|proc (x)
    proc (y) (x y)>. Use the rules to assign at least two types for each of
    these terms. Do the values of these expressions have the same types?

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-width|6spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<table|<row|<\cell>
          <verbatim|x>
        </cell>|<\cell>
          <math|\<in\>>
        </cell>|<\cell>
          <verbatim|int>
        </cell>>|<row|<\cell>
          <verbatim|proc (x) x>
        </cell>|<\cell>
          <math|\<in\>>
        </cell>|<\cell>
          <verbatim|(int -\<gtr\> int)>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          <verbatim|x>
        </cell>|<\cell>
          <math|\<in\>>
        </cell>|<\cell>
          <verbatim|bool>
        </cell>>|<row|<\cell>
          <verbatim|proc (x) x>
        </cell>|<\cell>
          <math|\<in\>>
        </cell>|<\cell>
          <verbatim|(bool -\<gtr\> bool)>
        </cell>>>>
      </wide-tabular>

      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-width|6spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<table|<row|<\cell>
          <verbatim|y>
        </cell>|<\cell>
          <math|\<in\>>
        </cell>|<\cell>
          <verbatim|int>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          <verbatim|(x y)>
        </cell>|<\cell>
          <math|\<in\>>
        </cell>|<\cell>
          <verbatim|t>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          <verbatim|proc (y) (x y)>
        </cell>|<\cell>
          <math|\<in\>>
        </cell>|<\cell>
          <verbatim|(int -\<gtr\> t)>
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          <verbatim|proc (x) proc (y) (x y)>
        </cell>|<\cell>
          <math|\<in\>>
        </cell>|<\cell>
          <verbatim|((int -\<gtr\> t) -\<gtr\> t)>
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <section|CHECKED: A Type-Checked Language>

  <\exercise>
    Extend the checker to handle multiple <verbatim|let> declarations,
    multiargument procedures, and multiple <verbatim|letrec> declarations.
    You will need to add types of the form <verbatim|(t1 * t2 * ... * tn
    -\<gtr\> t)> to handle multiargument procedures.

    <\solution*>
      \;

      See source code in folde \Psection-7.3\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the checker to handle assignments (section 4.3).

    <\solution*>
      \;

      See source code in folde \Psection-7.3\Q.
    </solution*>
  </exercise>

  <\exercise>
    Change the code for checking an <verbatim|if-exp> so that if the test
    expression is not a boolean, the other expressions are not checked. Give
    an expression for which the new version of the checker behaves
    differently from the old version.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\scm-code>
            (define type-of

            \ \ (lambda (exp tenv)

            \ \ \ \ (cases expression exp

            \ \ \ \ \ \ ...

            \ \ \ \ \ \ [if-exp

            \ \ \ \ \ \ \ (exp1 exp2 exp3)

            \ \ \ \ \ \ \ (let ([t2 (type-of exp2 tenv)]

            \ \ \ \ \ \ \ \ \ \ \ \ \ [t3 (type-of exp3 tenv)])

            \ \ \ \ \ \ \ \ \ ;; no need to check test type

            \ \ \ \ \ \ \ \ \ (check-equal-type! t2 t3 (list exp2 exp3))

            \ \ \ \ \ \ \ \ \ t2)]

            \ \ \ \ \ \ ...

            \ \ \ \ \ \ )))
          </scm-code>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <\scm-code>
            (define value-of

            \ \ (lambda (exp env)

            \ \ \ \ (cases expression exp

            \ \ \ \ \ \ ...

            \ \ \ \ \ \ [if-exp

            \ \ \ \ \ \ \ (exp1 exp2 exp3)

            \ \ \ \ \ \ \ (let* ([test (expval-\<gtr\>any (value-of exp1
            env))]

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ [test (if (boolean? test) test #t)])

            \ \ \ \ \ \ \ \ \ (if test

            \ \ \ \ \ \ \ \ \ \ \ \ \ (value-of exp2 env)

            \ \ \ \ \ \ \ \ \ \ \ \ \ (value-of exp3 env)))]

            \ \ \ \ \ \ ...

            \ \ \ \ \ \ )))
          </scm-code>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Add <verbatim|pairof> types to the language. Say that a value is of type
    <verbatim|pairof> <math|t<rsub|1><space|0.5em>
    \<ast\><space|0.5em>t<rsub|2>> if and only if it is a pair consisting of
    a value of type <math|t<rsub|1>> and a value of type <math|t<rsub|2>>.
    Add to the language the following productions:

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-width|8spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-bsep|2sep>|<cwith|1|-1|1|-1|cell-lsep|1spc>|<cwith|1|-1|1|-1|cell-rsep|1spc>|<cwith|1|-1|1|-1|cell-tsep|2sep>|<cwith|2|2|2|2|cell-bsep|8sep>|<cwith|2|2|2|2|cell-tsep|2sep>|<cwith|4|4|2|2|cell-bsep|8sep>|<cwith|4|4|2|2|cell-tsep|2sep>|<cwith|7|7|2|2|cell-bsep|8sep>|<cwith|7|7|2|2|cell-tsep|2sep>|<table|<row|<\cell>
        <em|Type>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|pairof><space|1em><em|Type<space|1em>*<space|1em>Type>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          pair-type (ty1 ty2)
        </frame>
      </cell>>|<row|<\cell>
        <em|Expression>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|newpair><space|1em><em|(Expression<space|1em>,<space|1em>Expression)>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          pair-exp (exp1 exp2)
        </frame>
      </cell>>|<row|<\cell>
        <em|Expression>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|unpair><space|1em><em|Identifier<space|1em>Identifier<space|1em>=<space|1em>Expression>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|in><space|1em><em|Expression>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          unpair-exp (var1 var2 exp body)
        </frame>
      </cell>>>>
    </wide-tabular>

    A <verbatim|pair> expression creates a pair; an <verbatim|unpair>
    expression (like exercise 3.18) binds its two variables to the two parts
    of the expression; the scope of these variables is <verbatim|body>. The
    typing rules for <verbatim|pair> and <verbatim|unpair> are:

    <\wide-tabular>
      <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-bborder|1ln>|<cwith|2|2|2|2|cell-tborder|0ln>|<cwith|1|-1|2|2|cell-lsep|-5spc>|<cwith|1|-1|2|2|cell-rsep|-5spc>|<cwith|1|-1|2|2|cell-tsep|1sep>|<cwith|1|-1|2|2|cell-width|104spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<twith|table-hmode|auto>|<cwith|1|-1|1|1|cell-width|15spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of><space|1em><math|e<rsub|1>><space|1em><math|t e n
        v><verbatim|)> = <math|t<rsub|1>>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of><space|1em><math|e<rsub|2>><space|1em><math|t e n
        v>) = <math|t<rsub|2>>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of (pair-exp><space|1em><math|e<rsub|1><space|1em>e<rsub|2>><verbatim|)><space|1em><math|t
        e n v><verbatim|)> = <verbatim|pairof><space|1em><math|t<rsub|1><space|1em>\<ast\><space|1em>t<rsub|2>>
      </cell>>>>
    </wide-tabular>

    <\wide-tabular>
      <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-bborder|1ln>|<cwith|2|2|2|2|cell-tborder|0ln>|<cwith|1|-1|2|2|cell-lsep|-5spc>|<cwith|1|-1|2|2|cell-rsep|-5spc>|<cwith|1|-1|2|2|cell-tsep|1sep>|<cwith|1|-1|2|2|cell-width|108spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|-1|1|1|cell-width|15spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<twith|table-hmode|auto>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of><space|1em><math|e<rsub|p a i
        r>><space|1em><math|t e n v><verbatim|)> =
        <verbatim|(pairof><space|1em><math|t<rsub|1>><space|1em><math|t<rsub|2>><verbatim|)><samp|>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of><space|1em><math|e<rsub|b o d y>> <math|[v a
        r<rsub|1>=t<rsub|1>]><space|1em><math|[v a r<rsub|2>=t<rsub|2>]t e n
        v><verbatim|)> = <math|t<rsub|b o d y>>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of (unpair-exp><space|1em><math|v a
        r<rsub|1>><space|1em><math|v a r<rsub|2>><space|1em><math|e<rsub|1>><space|1em><math|e<rsub|b
        o d y>><verbatim|)><space|1em><math|t e n v>) = <math|t<rsub|b o d
        y>>
      </cell>>>>
    </wide-tabular>

    Extend CHECKED to implement these rules. In
    <verbatim|type-to-external-form>, produce the list <verbatim|(pairof t1
    t2)> for a pair type.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Add <verbatim|listof> types to the language, with operations similar to
    those of exercise 3.9. A value is of type <verbatim|listof> <em|t> if and
    only if it is a list and all of its elements are of type <em|t>. Extend
    the language with the productions

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-width|8spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-bsep|2sep>|<cwith|1|-1|1|-1|cell-lsep|1spc>|<cwith|1|-1|1|-1|cell-rsep|1spc>|<cwith|1|-1|1|-1|cell-tsep|2sep>|<cwith|2|2|2|2|cell-bsep|8sep>|<cwith|2|2|2|2|cell-tsep|2sep>|<cwith|4|4|2|2|cell-bsep|8sep>|<cwith|4|4|2|2|cell-tsep|2sep>|<cwith|10|10|2|2|cell-bsep|8sep>|<cwith|10|10|2|2|cell-tsep|2sep>|<table|<row|<\cell>
        <em|Type>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|listof><space|1em><em|Type>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          list-type (ty)
        </frame>
      </cell>>|<row|<\cell>
        <em|Expression>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|list><space|1em><em|(Expression<space|1em>{,Expression}<math|<rsup|\<ast\>>>
        )>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          list-exp (exp1 exps)
        </frame>
      </cell>>|<row|<\cell>
        <em|Expression>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|cons><space|1em><em|(Expression<space|1em>,<space|1em>Expression)>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          cons-exp (exp1 exp2)
        </frame>
      </cell>>|<row|<\cell>
        <em|Expression>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|null?><space|1em><em|(Expression)>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          null-exp (exp1)
        </frame>
      </cell>>|<row|<\cell>
        <em|Expression>
      </cell>|<\cell>
        ::=
      </cell>|<\cell>
        <verbatim|emptylist><space|1em><em|Type>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <\frame>
          emptylist-exp (ty)
        </frame>
      </cell>>>>
    </wide-tabular>

    with types given by the following four rules:

    <\wide-tabular>
      <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|4|4|2|2|cell-bborder|1ln>|<cwith|4|4|2|2|cell-tborder|0ln>|<cwith|1|-1|2|2|cell-lsep|0spc>|<cwith|1|-1|2|2|cell-rsep|0spc>|<cwith|1|-1|1|1|cell-width|15spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-bsep|2sep>|<cwith|1|-1|1|-1|cell-tsep|2sep>|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|>|<cwith|1|-1|2|2|cell-hmode|auto>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of><space|1em><math|e<rsub|1>><space|1em><math|t e n
        v><verbatim|)> = <math|t>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of><space|1em><math|e<rsub|2>><space|1em><math|t e n
        v>) = <math|t>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <math|\<vdots\>>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of><space|1em><math|e<rsub|n>><space|1em><math|t e n
        v>) = <math|t>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of (list-exp><space|1em><math|e<rsub|1><space|1em><around*|(|e<rsub|2><space|1em>\<ldots\><space|1em>e<rsub|n>|)>><verbatim|)><space|1em><math|t
        e n v><verbatim|)> = <verbatim|listof><space|1em><math|t>
      </cell>>>>
    </wide-tabular>

    <\wide-tabular>
      <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-bborder|1ln>|<cwith|2|2|2|2|cell-tborder|0ln>|<cwith|1|-1|1|1|cell-width|15spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|2|2|cell-rsep|0spc>|<cwith|1|-1|2|2|cell-lsep|0spc>|<cwith|1|-1|1|-1|cell-bsep|2sep>|<cwith|1|-1|1|-1|cell-tsep|2sep>|<cwith|2|2|1|1|cell-width|>|<cwith|2|2|1|1|cell-hmode|auto>|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|>|<cwith|1|-1|2|2|cell-hmode|auto>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of><space|1em><math|e<rsub|1>><space|1em><math|t e n
        v><verbatim|)> = <math|t>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of><space|1em><math|e<rsub|2>><space|1em><math|t e n
        v>) = <verbatim|listof> <math|t>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of cons(><math|e<rsub|1>,
        e<rsub|2>><verbatim|)><space|1em><math|t e n v><verbatim|)> =
        <verbatim|listof><space|1em><math|t>
      </cell>>>>
    </wide-tabular>

    <\wide-tabular>
      <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|1|2|2|cell-bborder|1ln>|<cwith|1|1|2|2|cell-tborder|0ln>|<cwith|1|-1|1|1|cell-width|15spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|2|2|cell-rsep|0spc>|<cwith|1|-1|2|2|cell-lsep|0spc>|<cwith|1|-1|1|-1|cell-bsep|2sep>|<cwith|1|-1|1|-1|cell-tsep|2sep>|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|>|<cwith|1|-1|2|2|cell-hmode|auto>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of><space|1em><math|e<rsub|1>><space|1em><math|t e n
        v>) = <verbatim|listof> <math|t>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of null?(><math|e<rsub|1>><verbatim|)><space|1em><math|t
        e n v><verbatim|)> = <verbatim|bool>
      </cell>>>>
    </wide-tabular>

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|15spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-halign|l>|<cwith|1|1|2|2|cell-rsep|0spc>|<cwith|1|1|2|2|cell-lsep|0spc>|<cwith|1|1|1|-1|cell-bsep|2sep>|<cwith|1|1|1|-1|cell-tsep|2sep>|<twith|table-hmode|auto>|<cwith|1|1|2|2|cell-width|>|<cwith|1|1|2|2|cell-hmode|auto>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <verbatim|(type-of emptylist> <math|<around*|[|t|]>><space|1em><math|t
        e n v><verbatim|)> = <verbatim|listof><space|1em><math|t>
      </cell>>>>
    </wide-tabular>

    Although <verbatim|cons> is similar to pair, it has a very different
    typing rule.

    Write similar rules for <verbatim|car> and <verbatim|cdr>, and extend the
    checker to handle these as well as the other expressions. Use a trick
    similar to the one in exercise 7.8 to avoid conflict with
    <verbatim|proc-type-exp>. These rules should guarantee that
    <verbatim|car> and <verbatim|cdr> are applied to lists, but they should
    not guarantee that the lists be non-empty. Why would it be unreasonable
    for the rules to guarantee that the lists be non-empty? Why is the type
    parameter in <verbatim|emptylist> necessary?

    <\solution*>
      \;

      If use <verbatim|cons(e1, e2)> start up a list and <verbatim|e2> is a
      <verbatim|emptylist>, then <verbatim|e2> contained type must be same as
      <verbatim|e1>. Even <verbatim|e2> is a <verbatim|emptylist>, it must
      return a type to be checked.

      Elided.

      Recommend reading The Typed Racket Guide in Racket Documentation.
    </solution*>
  </exercise>

  <\exercise>
    Extend the checker to handle EXPLICIT-REFS. You will need to do the
    following:

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|-1|cell-bsep|4sep>|<cwith|1|-1|1|-1|cell-tsep|4sep>|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        <math|\<bullet\>>
      </cell>|<\cell>
        Add to the type system the types <verbatim|refto> <em|t>, where
        <em|t> is any type. This is the type of references to locations
        containing a value of type <em|t>. Thus, if <em|e> is of type <em|t>,
        <verbatim|(newref e)> is of type <verbatim|refto> <em|t>.
      </cell>>|<row|<\cell>
        <math|\<bullet\>>
      </cell>|<\cell>
        Add to the type system the type <verbatim|void>. This is the type of
        the value returned by <verbatim|setref>. You can't apply any
        operation to a value of type <verbatim|void>, so it doesn't matter
        what value <verbatim|setref> returns. This is an example of types
        serving as an information-hiding mechanism.
      </cell>>|<row|<\cell>
        <math|\<bullet\>>
      </cell>|<\cell>
        Write down typing rules for <verbatim|newref>, <verbatim|deref>, and
        <verbatim|setref>.
      </cell>>|<row|<\cell>
        <math|\<bullet\>>
      </cell>|<\cell>
        Implement these rules in the checker.
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|1|2|2|cell-bborder|1ln>|<cwith|1|1|2|2|cell-tborder|0ln>|<cwith|1|-1|1|1|cell-width|15spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|2|2|cell-rsep|0spc>|<cwith|1|-1|2|2|cell-lsep|0spc>|<cwith|1|-1|1|-1|cell-bsep|4sep>|<cwith|1|-1|1|-1|cell-tsep|4sep>|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|>|<cwith|1|-1|2|2|cell-hmode|auto>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(type-of><space|1em><math|e><space|1em><math|t e n
          v><verbatim|)> = <math|t>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(type-of (newref ><math|e<rsub|>><verbatim|)><space|1em><math|t
          e n v><verbatim|)> = <verbatim|refto> <math|t>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|1|2|2|cell-bborder|1ln>|<cwith|1|1|2|2|cell-tborder|0ln>|<cwith|1|-1|1|1|cell-width|15spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|2|2|cell-rsep|0spc>|<cwith|1|-1|2|2|cell-lsep|0spc>|<cwith|1|-1|1|-1|cell-bsep|4sep>|<cwith|1|-1|1|-1|cell-tsep|4sep>|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|>|<cwith|1|-1|2|2|cell-hmode|auto>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(type-of><space|1em><math|e><space|1em><math|t e n
          v><verbatim|)> = <verbatim|refto> <math|t>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(type-of (deref ><math|e<rsub|>><verbatim|)><space|1em><math|t
          e n v><verbatim|)> = <math|t>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-bborder|1ln>|<cwith|2|2|2|2|cell-tborder|0ln>|<cwith|1|-1|1|1|cell-width|15spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|-1|2|2|cell-rsep|0spc>|<cwith|1|-1|2|2|cell-lsep|0spc>|<cwith|1|-1|1|-1|cell-bsep|4sep>|<cwith|1|-1|1|-1|cell-tsep|4sep>|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|>|<cwith|1|-1|2|2|cell-hmode|auto>|<table|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(type-of><space|1em><math|e<rsub|1>><space|1em><math|t e
          n v><verbatim|)> = <verbatim|refto> <math|t>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(type-of><space|1em><math|e<rsub|2>><space|1em><math|t e
          n v>) = <verbatim|><math|t>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          <verbatim|(type-of (setref ><math|e<rsub|1><space|1em>
          e<rsub|2>><verbatim|)><space|1em><math|t e n v><verbatim|)> =
          <verbatim|void>
        </cell>>>>
      </wide-tabular>

      Code implementing elided.
    </solution*>
  </exercise>

  <\exercise>
    Extend the checker to handle MUTABLE-PAIRS.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <section|INFERRED: A Language with Type Inference>

  <\exercise>
    Using the methods in this section, derive types for each of the
    expressions in exercise 7.1, or determine that no such type exists. As in
    the other examples of this section, assume there is a ? attached to each
    bound variable.

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          1.
        </cell>|<\cell>
          <\wide-tabular>
            <tformat|<cwith|1|-1|1|1|cell-width|>|<cwith|1|-1|1|1|cell-hmode|auto>|<twith|table-hmode|auto>|<table|<row|<\cell>
              <verbatim|proc (x) -(x,3)>
            </cell>|<\cell>
              <math|t<rsub|0>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <math|t<rsub|1>>
            </cell>>|<row|<\cell>
              <verbatim|-(x,3)>
            </cell>|<\cell>
              <math|t<rsub|1>> = <verbatim|int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|x>> = <verbatim|int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>> = <verbatim|int> <math|\<rightarrow\>>
              <verbatim|int>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          2.
        </cell>|<\cell>
          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<table|<row|<\cell>
              <verbatim|proc (f) proc (x) -((f x), 1)>
            </cell>|<\cell>
              <math|t<rsub|0>> = <math|t<rsub|f>> <math|\<rightarrow\>>
              <math|t<rsub|1>>
            </cell>>|<row|<\cell>
              <math|><verbatim|proc (x) -((f x), 1)>
            </cell>|<\cell>
              <math|t<rsub|1>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <math|t<rsub|2>>
            </cell>>|<row|<\cell>
              <verbatim|-((f x), 1)>
            </cell>|<\cell>
              <math|t<rsub|3>> = <verbatim|int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|2>> = <verbatim|int>
            </cell>>|<row|<\cell>
              <verbatim|(f x)>
            </cell>|<\cell>
              <\with|par-mode|right>
                <math|t<rsub|f>> = <math|t<rsub|x>> <math|\<rightarrow\>>
                <math|t<rsub|3>>
              </with>
            </cell>>>>
          </wide-tabular>

          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              <math|t<rsub|0>> = <math|t<rsub|f>> <math|\<rightarrow\>>
              <math|t<rsub|1>>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>>|<row|<\cell>
              <math|t<rsub|1>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <math|t<rsub|2>>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>>|<row|<\cell>
              <math|t<rsub|3>> = <verbatim|int>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>>|<row|<\cell>
              <math|t<rsub|2>> = <verbatim|int>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>>|<row|<\cell>
              <math|t<rsub|f>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <math|t<rsub|3>>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>>>>
          </wide-tabular>

          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              <math|t<rsub|1>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <math|t<rsub|2>>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>> = <math|t<rsub|f>> <math|\<rightarrow\>>
              <math|t<rsub|1>>
            </cell>>|<row|<\cell>
              <math|t<rsub|3>> = <verbatim|int>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>>|<row|<\cell>
              <math|t<rsub|2>> = <verbatim|int>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>>|<row|<\cell>
              <math|t<rsub|f>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <math|t<rsub|3>>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>>>>
          </wide-tabular>

          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              <math|t<rsub|3>> = <verbatim|int>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>> = <math|t<rsub|f>> <math|\<rightarrow\>>
              (<math|t<rsub|x>> <math|\<rightarrow\>> <math|t<rsub|2>>)
            </cell>>|<row|<\cell>
              <math|t<rsub|2>> = <verbatim|int>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|1>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <math|t<rsub|2>>
            </cell>>|<row|<\cell>
              <math|t<rsub|f>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <math|t<rsub|3>>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>>>>
          </wide-tabular>

          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              <math|t<rsub|2>> = <verbatim|int>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>> = <math|t<rsub|f>> <math|\<rightarrow\>>
              (<math|t<rsub|x>> <math|\<rightarrow\>> <math|t<rsub|2>>)
            </cell>>|<row|<\cell>
              <math|t<rsub|f>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <math|t<rsub|3>>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|1>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <math|t<rsub|2>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|3>> = <verbatim|int>
            </cell>>>>
          </wide-tabular>

          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              <math|t<rsub|f>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <math|t<rsub|3>>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>> = <math|t<rsub|f>> <math|\<rightarrow\>>
              (<math|t<rsub|x>> <math|\<rightarrow\>> <verbatim|int>)
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|1>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <verbatim|int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|3>> = <verbatim|int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|2>> = <verbatim|int>
            </cell>>>>
          </wide-tabular>

          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>> = (<math|t<rsub|x>> <math|\<rightarrow\>>
              <verbatim|int>) <math|\<rightarrow\>> (<math|t<rsub|x>>
              <math|\<rightarrow\>> <verbatim|int>)
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|1>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <verbatim|int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|3>> = <verbatim|int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|2>> = <verbatim|int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|f>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <verbatim|int>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          3.
        </cell>|<\cell>
          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>> = <math|t<rsub|x>> <math|\<rightarrow\>>
              <math|t<rsub|x>>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          4.
        </cell>|<\cell>
          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>> = (<math|t<rsub|y>\<rightarrow\>t<rsub|2>>)
              <math|\<rightarrow\>> (<math|t<rsub|y>\<rightarrow\>t<rsub|2>>)
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <\math>
                t<rsub|1>=t<rsub|y>\<rightarrow\>t<rsub|2>
              </math>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|x>=t<rsub|y>\<rightarrow\>t<rsub|2>>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          5.
        </cell>|<\cell>
          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>=<around*|(|int\<rightarrow\>t<rsub|1>|)>\<rightarrow\>t<rsub|1>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|x>=int\<rightarrow\>t<rsub|1>>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          6.
        </cell>|<\cell>
          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>=<around*|(|t<rsub|x>\<rightarrow\>t<rsub|1>|)>\<rightarrow\>t<rsub|1>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|x>=t<rsub|x>\<rightarrow\>t<rsub|1>>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          7.
        </cell>|<\cell>
          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>=bool\<rightarrow\> int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|x >=bool>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|1>= int>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          8.
        </cell>|<\cell>
          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>=bool\<rightarrow\>
              <around*|(|int\<rightarrow\>int|)>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|1>=int\<rightarrow\>int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|x>=bool>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|y>=int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|2>=int>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          9.
        </cell>|<\cell>
          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>=int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|1>=int\<rightarrow\>int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|1>=bool\<rightarrow\>int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|p>=bool>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|2>=int>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          10.
        </cell>|<\cell>
          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>=int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|1>=bool\<rightarrow\>int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|2>=bool>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|3>=int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|p>=bool>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|z>=bool>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          11.
        </cell>|<\cell>
          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>=<around*|(|t<rsub|x>\<rightarrow\>int|)>\<rightarrow\><around*|(|<around*|(|int\<rightarrow\>int|)>\<rightarrow\><around*|(|<around*|(|int\<rightarrow\>bool|)>\<rightarrow\><around*|(|t<rsub|x>\<rightarrow\>int|)>|)>|)>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|1>=<around*|(|int\<rightarrow\>int|)>\<rightarrow\><around*|(|<around*|(|int\<rightarrow\>bool|)>\<rightarrow\><around*|(|t<rsub|x>\<rightarrow\>int|)>|)>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|2>=<around*|(|int\<rightarrow\>bool|)>\<rightarrow\><around*|(|t<rsub|x>\<rightarrow\>int|)>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|3>=t<rsub|x>\<rightarrow\>int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|4>=int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|5>=int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|6>=bool>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|7>=int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|f>=t<rsub|x>\<rightarrow\>int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|g>=int\<rightarrow\>int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|p>=int\<rightarrow\>bool>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          12.
        </cell>|<\cell>
          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>=int\<rightarrow\><around*|(|<around*|(|int\<rightarrow\>bool|)>\<rightarrow\><around*|(|<around*|(|<around*|(|int\<rightarrow\>bool|)>\<rightarrow\>int|)>\<rightarrow\>
              int|)>|)>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|1>=<around*|(|int\<rightarrow\>bool|)>\<rightarrow\><around*|(|<around*|(|<around*|(|int\<rightarrow\>bool|)>\<rightarrow\>int|)>\<rightarrow\>
              int|)>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|2>=<around*|(|<around*|(|int\<rightarrow\>bool|)>\<rightarrow\>int|)>\<rightarrow\>
              int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|3>=int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|4>=bool>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|p>=int\<rightarrow\>bool>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|x>= int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|5>=int>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|f>=<around*|(|int\<rightarrow\>bool|)>\<rightarrow\>int>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>

      <\wide-tabular>
        <tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-width|6.5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|2|2|cell-bsep|2sep>|<cwith|1|1|2|2|cell-tsep|2sep>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-rsep|1spc>|<cwith|1|1|1|1|cell-tsep|4sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
          13.
        </cell>|<\cell>
          It makes my head spin.

          <\wide-tabular>
            <tformat|<twith|table-hmode|auto>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|1|1|3|3|cell-bborder|1ln>|<cwith|1|1|3|3|cell-tborder|0ln>|<table|<row|<\cell>
              <strong|Equations>
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <strong|Substitution>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|0>=<around*|(|t<rsub|5>\<rightarrow\>t<rsub|4>|)>\<rightarrow\><around*|(|t<rsub|n>\<rightarrow\>t<rsub|3>|)>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|1>=<around*|(|t<rsub|x>\<rightarrow\>t<rsub|5>|)>\<rightarrow\><around*|(|t<rsub|z>\<rightarrow\>t<rsub|3>|)>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|2>=t<rsub|z>\<rightarrow\>t<rsub|3>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|6>=t<rsub|n>\<rightarrow\>t<rsub|3>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|x>=t<rsub|x>\<rightarrow\>t<rsub|5>>
            </cell>>|<row|<\cell>
              \;
            </cell>|<\cell>
              \;
            </cell>|<\cell>
              <math|t<rsub|f>=t<rsub|5>\<rightarrow\>t<rsub|4>>
            </cell>>>>
          </wide-tabular>
        </cell>>>>
      </wide-tabular>
    </solution*>
  </exercise>

  <\exercise>
    Write down a rule for doing type inference for <verbatim|let>
    expressions. Using your rule, derive types for each of the following
    expressions, or determine that no such type exists.

    <\enumerate-numeric>
      <item><verbatim|let x = 4 in (x 3)>

      <item><verbatim|let f = proc (z) z in proc (x) -((f x), 1)>

      <item><verbatim|let p = zero?(1) in if p then 88 else 99>

      <item><verbatim|let p = proc (z) z in if p then 88 else 99>
    </enumerate-numeric>

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<\cell>
          <verbatim|(let-exp var exp body)>
        </cell>|<\cell>
          :
        </cell>|<\cell>
          <math|t<rsub|var>=t<rsub|exp>>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>|<\cell>
          <math|t e n v<around*|[|t<rsub|var>|]>>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>|<\cell>
          <math|t<rsub|let-exp>=t<rsub|body>>
        </cell>>>>
      </wide-tabular>

      <\enumerate-numeric>
        <item>no type.

        <item><math|int\<rightarrow\>int>.

        <item><math|int>.

        <item>no type.
      </enumerate-numeric>
    </solution*>
  </exercise>

  <\exercise>
    What is wrong with this expression?

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          letrec

          \ ? even(odd : ?) =

          \ \ \ \ proc (x : ?)

          \ \ \ \ \ if zero?(x) then 1 else (odd -(x,1))

          in letrec

          \ \ \ \ ? odd(x : bool) =

          \ \ \ \ \ \ \ if zero?(x) then 0 else ((even odd) -(x,1))

          \ \ \ in (odd 13)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      In second <verbatim|letrec>, <verbatim|odd>'s parameter <verbatim|x>
      should be <verbatim|(x : int)> or <verbatim|(x : ?)>.
    </solution*>
  </exercise>

  <\exercise>
    Write down a rule for doing type inference for a <verbatim|letrec>
    expression. Your rule should handle multiple declarations in a
    <verbatim|letrec>. Using your rule, derive types for each of the
    following expressions, or determine that no such type exists:

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-tsep|2sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
        1.
      </cell>|<\cell>
        <\verbatim-code>
          letrec ? f (x : ?)

          \ \ \ \ \ \ \ = if zero?(x) then 0 else -((f -(x,1)), -2)

          in f
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-tsep|2sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
        2.
      </cell>|<\cell>
        <\verbatim-code>
          letrec ? even (x : ?)

          \ \ \ \ \ \ \ \ \ \ = if zero?(x) then 1 else (odd -(x,1))

          \ \ \ \ \ \ \ ? odd (x : ?)

          \ \ \ \ \ \ \ \ \ \ = if zero?(x) then 0 else (even -(x,1))

          in (odd 13)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<cwith|1|1|1|1|cell-valign|t>|<cwith|1|1|1|1|cell-tsep|2sep>|<cwith|1|1|1|1|cell-bsep|1sep>|<table|<row|<\cell>
        3.
      </cell>|<\cell>
        <\verbatim-code>
          letrec ? even (odd : ?)

          \ \ \ \ \ \ \ \ \ \ = proc (x) if zero?(x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then 1

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else (odd -(x,1))

          in letrec ? odd (x : ?) =

          \ \ \ \ \ \ \ \ \ \ \ \ \ if zero?(x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ then 0

          \ \ \ \ \ \ \ \ \ \ \ \ \ else ((even odd) -(x,1))

          \ \ \ in (odd 13)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    <\solution*>
      \;

      <\wide-tabular>
        <tformat|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-width|5spc>|<cwith|1|-1|2|2|cell-hmode|exact>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<\cell>
          <verbatim|(letrec-exp bounds body)>
        </cell>|<\cell>
          :
        </cell>|<\cell>
          <math|t<rsub|var1>=t<rsub|exp1>>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>|<\cell>
          <math|t<rsub|var2>=t<rsub|exp2>>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>|<\cell>
          <math|\<vdots\>>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>|<\cell>
          <math|t e n v<around*|[|t<rsub|var-n> \<ldots\>
          t<rsub|var2>,t<rsub|var1>|]>>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>|<\cell>
          <math|t<rsub|letrec-exp>=t<rsub|body>>
        </cell>>>>
      </wide-tabular>

      <\enumerate-numeric>
        <item><math|int\<rightarrow\>int>

        <item><math|int>

        <item>int
      </enumerate-numeric>
    </solution*>
  </exercise>

  <\exercise>
    Modify the grammar of INFERRED so that missing types are simply omitted,
    rather than marked with ?.

    <\solution*>
      \;

      There will be non-checked language.
    </solution*>
  </exercise>

  <\exercise>
    In our representation, <verbatim|extend-subst> may do a lot of work if
    \<sigma\> is large. Implement an alternate representation in which
    <verbatim|extend-subst> is implemented as

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          (define extend-subst

          \ \ (lambda (subst tvar ty)

          \ \ \ \ (cons (cons tvar ty) subst)))
        </scm-code>
      </cell>>>>
    </wide-tabular>

    and the extra work is shifted to <verbatim|apply-subst-to-type>, so that
    the property <math|t(\<sigma\>[t<rsub|v> = t<lprime|`>]) =
    (t\<sigma\>)[t<rsub|v> = t ]> is still satisfied. For this definition of
    <verbatim|extend-subst>, is the no-occurrence invariant needed?

    <\solution*>
      \;

      Yes, it needed.

      See source code in file \Psection-7.4/subst.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Modify the implementation in the preceding exercise so that
    <verbatim|apply-subst-to-type> computes the substitution for any type
    variable at most once.

    <\solution*>
      \;

      See source code in file \Psection-7.4/subst.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    We wrote: \PIf <verbatim|ty1> is an unknown type, then the no-occurrence
    invariant tells us that it is not bound in the substitution.\Q Explain in
    detail why this is so.

    <\solution*>
      \;

      Before this, call <verbatim|apply-subst-to-type> with
      <verbatim|ty1(old)>,where returned ruslut to a new <verbatim|ty1(new)>.
      If <verbatim|ty1(old)> is bound, then <verbatim|ty1(new)> will not be
      an unknown type.
    </solution*>
  </exercise>

  <\exercise>
    Modify the unifier so that it calls <verbatim|apply-subst-to-type> only
    on type variables, rather than on its arguments.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    We said the substitution is like a store. Implement the unifier, using
    the representation of substitutions from exercise 7.17, and keeping the
    substitution in a global Scheme variable, as we did in figures 4.1 and
    4.2.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Refine the implementation of the preceding exercise so that the binding
    of each type variable can be obtained in constant time.

    <\solution*>
      \;

      See source code in file \Psection-7.4/unifier.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the inferencer to handle pair types, as in exercise 7.8.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Extend the inferencer to handle multiple let declarations, multiargument
    procedures, and multiple <verbatim|letrec> declarations.

    <\solution*>
      \;

      See source code in folder \Psection-7.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the inferencer to handle list types, as in exercise 7.9. Modify
    the language to use the production

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <em|Expression><space|1em>::=<space|1em><verbatim|emptylist>
      </cell>>>>
    </wide-tabular>

    instead of

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <em|Expression><space|1em>::=<space|1em><verbatim|emptylist><em|_Type>
      </cell>>>>
    </wide-tabular>

    As a hint, consider creating a type variable in place of the missing _t.

    <\solution*>
      \;

      See source code in folder \Psection-7.4/7.27\Q.
    </solution*>
  </exercise>

  <\exercise>
    Extend the inferencer to handle EXPLICIT-REFS, as in exercise 7.10.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Rewrite the inferencer so that it works in two phases. In the first phase
    it should generate a set of equations, and in the second phase, it should
    repeatedly call <verbatim|unify> to solve them.

    <\solution*>
      \;

      See source code in folder \Psection-7.4/7.27\Q.
    </solution*>
  </exercise>

  <\exercise>
    Our inferencer is very useful, but it is not powerful enough to allow the
    programmer to define procedures that are polymorphic, like the
    polymorphic primitives <verbatim|pair> or <verbatim|cons>, which can be
    used at many types. For example, our inferencer would reject the program

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let f = proc (x : ?) x

          in if (f zero?(0))

          \ \ \ then (f 11)

          \ \ \ else (f 22)
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    even though its execution is safe, because <verbatim|f> is used both at
    type <verbatim|(bool\<rightarrow\> bool)> and at type
    <verbatim|(int\<rightarrow\> int)>. Since the inferencer of this section
    is allowed to find at most one type for <verbatim|f>, it will reject this
    program.

    For a more realistic example, one would like to write programs like

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          let

          \ ? map (f : ?) =

          \ \ \ \ letrec

          \ \ \ \ \ ? foo (x : ?) = if null?(x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then emptylist

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else cons((f car(x)),

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ((foo
          f) cdr(x)))

          \ \ \ \ \ in foo

          in letrec

          \ \ \ \ ? even (y : ?) = if zero?(y)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then zero?(0)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else if zero?(-(y,1))

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ then zero?(1)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else (even
          -(y,2))

          \ \ \ in pair(((map proc(x : int)-(x,1))

          \ \ \ \ \ \ \ \ \ \ \ cons(3,cons(5,emptylist))),

          \ \ \ \ \ \ \ \ \ \ \ ((map even)

          \ \ \ \ \ \ \ \ \ \ \ \ cons(3,cons(5,emptylist))))
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    This expression uses <verbatim|map> twice, once producing a list of
    <verbatim|int>s and once producing a list of <verbatim|bool>s. Therefore
    it needs two different types for the two uses. Since the inferencer of
    this section will find at most one type for <verbatim|map>, it will
    detect the clash between <verbatim|int> and <verbatim|bool> and reject
    the program.

    One way to avoid this problem is to allow polymorphic values to be
    introduced only by <verbatim|let>, and then to treat <verbatim|(let-exp
    var e1 e2)> differently from <verbatim|(call-exp (proc-exp var e2) e1)>
    for type-checking purposes.

    Add polymorphic bindings to the inferencer by treating <verbatim|(let-exp
    var e1 e2)> like the expression obtained by substituting <verbatim|e1>
    for each free occurrence of var in <verbatim|e2>. Then, from the point of
    view of the inferencer, there are many different copies of <verbatim|e1>
    in the body of the <verbatim|let>, so they can have different types, and
    the programs above will be accepted.

    <\solution*>
      \;

      I used <verbatim|Any> type to denote one of types we defined, so it is
      not as exact as representation in book.

      See source code in folder \Psection-7.4/7.27\Q.
    </solution*>
  </exercise>

  <\exercise>
    The type inference algorithm suggested in the preceding exercise will
    analyze e1 many times, once for each of its occurrences in e2. Implement
    Milner's Algorithm W, which analyzes e1 only once.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    The interaction between polymorphism and effects is subtle. Consider a
    program starting

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\scm-code>
          let p = newref(proc (x : ?) x)

          in ...
        </scm-code>
      </cell>>>>
    </wide-tabular>

    <\enumerate-numeric>
      <item>Finish this program to produce a program that passes the
      polymorphic inferencer, but whose evaluation is not safe according to
      the definition at the beginning of the chapter.

      <item>Avoid this difficulty by restricting the right-hand side of a
      <verbatim|let> to have no effect on the store. This is called the
      <em|value restriction>.
    </enumerate-numeric>

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <chapter|Modules>

  <p|Elided.>

  <chapter|Objects and Classes>

  <section|Object-Oriented Programming>

  <section|Inheritance>

  <section|The Language>

  <section|The Interpreter>

  <\exercise>
    Implement the following using the language of this section:

    <\enumerate-numeric>
      <item>A queue class with methods <verbatim|empty?>, <verbatim|enqueue>,
      and <verbatim|dequeue>.

      <item>Extend the queue class with a counter that counts the number of
      operations that have been performed on the current queue.

      <item>Extend the queue class with a counter that counts the total
      number of operations that have been performed on all the queues in the
      class. As a hint, remember that you can pass a shared counter object at
      initialization time.
    </enumerate-numeric>

    <\solution*>
      \;

      If use Scheme's <verbatim|list>, it is easy to be done. But if only
      uses OOP feature without any container, it yet may need with
      <em|explicit-refs> to do this.

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Inheritance can be dangerous, because a child class can arbitrarily
    change the behavior of a method by overriding it. Define a class
    <verbatim|bogus-oddeven> that inherits from <verbatim|oddeven> and
    overrides the method even so that let <verbatim|o1 = new bogus-oddeven()
    in send o1 odd (13)> gives the wrong answer.

    <\solution*>
      \;

      See source code in file \Psection-9.4/9.2.rkt\Q.
    </solution*>
  </exercise>

  <\exercise>
    In figure 9.11, where are method environments shared? Where are the
    <verbatim|field-names> lists shared?

    <\solution*>
      \;

      <verbatim|object> always be shared.
    </solution*>
  </exercise>

  <\exercise>
    Change the representation of objects so that an <em|Obj> contains the
    class of which the object is an instance, rather than its name. What are
    the advantages and disadvantages of this representation compared to the
    one in the text?

    <\solution*>
      \;

      Advantage: just search class enviroment once only when creating object,
      and save all env-information into object.

      Disadvantage: if the class has inherited many times, then the
      information saved may be huge.
    </solution*>
  </exercise>

  <\exercise>
    The interpreter of section 9.4 stores the superclass name of a method's
    host class in the lexical environment. Change the implementation so that
    the method stores the host class name, and retrieves the superclass name
    from the host name.

    <\solution*>
      \;

      See source code files in folder \Psection-9.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add to our language the expression <verbatim|instanceof> <em|exp
    class-name>. The value of this expression should be true if and only if
    the object obtained by evaluating exp is an instance of class-name or of
    one of its subclasses.

    <\solution*>
      \;

      See source code files in folder \Psection-9.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    In our language, the environment for a method includes bindings for the
    field variables declared in the host class <em|and> its superclasses.
    Limit them to just the host class.

    <\solution*>
      \;

      See source code files in folder \Psection-9.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add to our language a new expression,

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <verbatim|fieldref><space|1em><em|obj<space|1em>field-name>
      </cell>>>>
    </wide-tabular>

    that retrieves the contents of the given field of the object. Add also

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <verbatim|fieldset><space|1em><em|obj<space|1em>field-name<space|1em>=<space|1em>exp>
      </cell>>>>
    </wide-tabular>

    which sets the given field to the value of exp.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Add expressions <verbatim|superfieldref> field-name and
    <verbatim|superfieldset> <em|field-name = exp> that manipulate the fields
    of <verbatim|self> that would otherwise be shadowed. Remember
    <verbatim|super> is static, and always refers to the superclass of the
    host class.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Some object-oriented languages include facilities for named-class method
    invocation and field references. In a named-class method invocation, one
    might write <verbatim|named-send c1 o m1()>. This would invoke
    <verbatim|c1>'s <verbatim|m1> method on <verbatim|o>, so long as
    <verbatim|o> was an instance of <verbatim|c1> or of one of its
    subclasses, even if <verbatim|m1> were overridden in <verbatim|o>'s
    actual class. This is a form of static method dispatch. Named-class field
    reference provides a similar facility for field reference. Add
    named-class method invocation, field reference, and field setting to the
    language of this section.

    <\solution*>
      \;

      See source code files in folder \Psection-9.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Add to CLASSES the ability to specify that each method is either private
    and only accessible from within the host class, protected and only
    accessible from the host class and its descendants, or public and
    accessible from anywhere. Many object-oriented languages include some
    version of this feature.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Add to CLASSES the ability to specify that each field is either private,
    protected, or public as in exercise 9.11.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    To defend against malicious subclasses like bogus-oddeven in exercise
    9.2, many object-oriented languages have a facility for final methods,
    which may not be overridden. Add such a facility to CLASSES, so that we
    could write

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          class oddeven extends object

          \ \ method initialize () 1

          \ \ final method even (n)

          \ \ \ \ if zero?(n) then 1 else send self odd(-(n,1))

          \ \ final method odd (n)

          \ \ \ \ if zero?(n) then 0 else send self even(-(n,1))
        </verbatim-code>
      </cell>>>>
    </wide-tabular>
  </exercise>

  <\exercise>
    Another way to defend against malicious subclasses is to use some form of
    <em|static dispatch>. Modify CLASSES so that method calls to self always
    use the method in the host class, rather than the method in the class of
    the target object.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Many object-oriented languages include a provision for <em|static> or
    <em|class> variables. Static variables associate some state with a class;
    all the instances of the class share this state. For example, one might
    write:

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-width|5spc>|<cwith|1|-1|1|1|cell-hmode|exact>|<table|<row|<\cell>
        \;
      </cell>|<\cell>
        <\verbatim-code>
          class c1 extends object

          \ \ static next-serial-number = 1

          \ \ field my-serial-number

          \ \ method get-serial-number () my-serial-number

          \ \ method initialize ()

          \ \ \ \ begin

          \ \ \ \ \ \ set my-serial-number = next-serial-number;

          \ \ \ \ \ \ set next-serial-number = +(next-serial-number,1)

          \ \ \ \ end

          let o1 = new c1()

          \ \ \ \ o2 = new c1()

          in list(send o1 get-serial-number(),

          \ \ \ \ \ \ \ \ send o2 get-serial-number())
        </verbatim-code>
      </cell>>>>
    </wide-tabular>

    Each new object of class <verbatim|c1> receives a new consecutive serial
    number.

    Add static variables to our language. Since static variables can appear
    in a method body, <verbatim|apply-method> must add additional bindings in
    the environment it constructs. What environment should be used for the
    evaluation of the initializing expression for a static variable (1 in the
    example above)?

    <\solution*>
      \;

      Class environment rather then object environment.

      <verbatim|(static class-id var-id)>
    </solution*>
  </exercise>

  <\exercise>
    Object-oriented languages frequently allow <em|overloading> of methods.
    This feature allows a class to have multiple methods of the same name,
    provided they have distinct signatures. A method's signature is typically
    the method name plus the types of its parameters. Since we do not have
    types in CLASSES, we might overload based simply on the method name and
    number of parameters. For example, a class might have two
    <verbatim|initialize> methods, one with no parameters for use when
    initialization with a default field value is desired, and another with
    one parameter for use when a particular field value is desired. Extend
    our interpreter to allow overloading based on the number of method
    parameters.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    As it stands, the classes in our language are defined globally. Add to
    CLASSES a facility for local classes, so one can write something like
    <verbatim|letclass c = ...in e>. As a hint, consider adding the class
    environment as a parameter to the interpreter.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    The method environments produced by <verbatim|merge-method-envs> can be
    long. Write a new version of <verbatim|merge-method-envs> with the
    property that each method name occurs exactly once, and furthermore, it
    appears in the same place as its earliest declaration. For example, in
    figure 9.8, method <verbatim|m2> should appear in the same place in the
    method environments of <verbatim|c1>, <verbatim|c2>, <verbatim|c3>, and
    any descendant of <verbatim|c3>.

    <\solution*>
      \;

      Put method's AST into store model, object reference it's adress.

      See source code files in folder \Psection-9.4\Q.
    </solution*>
  </exercise>

  <\exercise>
    Implement lexical addressing for CLASSES. First, write a lexicaladdress
    calculator like that of section 3.7.1 for the language of this section.
    Then modify the implementation of environments to make them nameless, and
    modify <verbatim|value-of> so that <verbatim|apply-env> takes a lexical
    address instead of a symbol, as in section 3.7.2.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  <\exercise>
    Can anything equivalent to the optimizations of the exercise 9.19 be done
    for method invocations? Discuss why or why not.

    <\solution*>
      \;

      <verbatim|self-call> and <verbatim|super-call> can be converted to
      simple linear search, no recursive.

      But if directly use the reference adress of method saved in store
      model, it will a great improvement.
    </solution*>
  </exercise>

  <\exercise>
    If there are many methods in a class, linear search down a list of
    methods can be slow. Replace it by some faster implementation. How much
    improvement does your implementation provide? Account for your results,
    either positive or negative.

    <\solution*>
      \;

      Ditto.
    </solution*>
  </exercise>

  <\exercise>
    In exercise 9.16, we added overloading to the language by extending the
    interpreter. Another way to support overloading is not to modify the
    interpreter, but to use a syntactic preprocessor. Write a preprocessor
    that changes the name of every method <verbatim|m> to one of the form
    <verbatim|m:@n>, where <verbatim|n> is the number of parameters in the
    method declaration. It must similarly change the name in every method
    call, based on the number of operands. We assume that <verbatim|:@> is
    not used by programmers in method names, but is accepted by the
    interpreter in method names. Compilers frequently use such a technique to
    implement method overloading. This is an instance of a general trick
    called <em|name mangling>.

    <\solution*>
      \;

      Elided.
    </solution*>
  </exercise>

  \;
</body>

<\initial>
  <\collection>
    <associate|font-base-size|12>
    <associate|item-hsep|<macro|1.3fn>>
    <associate|item-vsep|<macro|0fn>>
    <associate|math-font|math-pagella>
    <associate|page-even|30mm>
    <associate|page-medium|papyrus>
    <associate|page-odd|30mm>
    <associate|page-right|15mm>
    <associate|par-first|0tab>
    <associate|par-par-sep|0.6666fn>
    <associate|src-style|scheme>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|2.4|19>>
    <associate|auto-11|<tuple|2.5|21>>
    <associate|auto-12|<tuple|3|25>>
    <associate|auto-13|<tuple|3.1|25>>
    <associate|auto-14|<tuple|3.2|25>>
    <associate|auto-15|<tuple|3.3|29>>
    <associate|auto-16|<tuple|3.4|34>>
    <associate|auto-17|<tuple|3.5|36>>
    <associate|auto-18|<tuple|3.6|36>>
    <associate|auto-19|<tuple|3.7|36>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-20|<tuple|4|39>>
    <associate|auto-21|<tuple|4.1|39>>
    <associate|auto-22|<tuple|4.2|39>>
    <associate|auto-23|<tuple|4.3|41>>
    <associate|auto-24|<tuple|4.4|46>>
    <associate|auto-25|<tuple|4.5|47>>
    <associate|auto-26|<tuple|5|51>>
    <associate|auto-27|<tuple|5.1|51>>
    <associate|auto-28|<tuple|5.2|54>>
    <associate|auto-29|<tuple|5.3|56>>
    <associate|auto-3|<tuple|1.2|3>>
    <associate|auto-30|<tuple|5.4|59>>
    <associate|auto-31|<tuple|5.5|62>>
    <associate|auto-32|<tuple|6|67>>
    <associate|auto-33|<tuple|6.1|67>>
    <associate|auto-34|<tuple|6.2|70>>
    <associate|auto-35|<tuple|6.3|73>>
    <associate|auto-36|<tuple|6.4|78>>
    <associate|auto-37|<tuple|7|81>>
    <associate|auto-38|<tuple|7.1|81>>
    <associate|auto-39|<tuple|7.2|82>>
    <associate|auto-4|<tuple|1.3|4>>
    <associate|auto-40|<tuple|7.3|83>>
    <associate|auto-41|<tuple|7.4|86>>
    <associate|auto-42|<tuple|8|93>>
    <associate|auto-43|<tuple|9|95>>
    <associate|auto-44|<tuple|9.1|?>>
    <associate|auto-45|<tuple|9.2|?>>
    <associate|auto-46|<tuple|9.3|?>>
    <associate|auto-47|<tuple|9.4|?>>
    <associate|auto-5|<tuple|1.4|5>>
    <associate|auto-6|<tuple|2|13>>
    <associate|auto-7|<tuple|2.1|13>>
    <associate|auto-8|<tuple|2.2|14>>
    <associate|auto-9|<tuple|2.3|17>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|1.<space|2spc>Inductive
      Sets of Data> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      1.1 Recursively Specified Data <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      1.2 Deriving Recursive Programs <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      1.3 Auxiliary Procedures and Context Arguments
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      1.4 Exercises <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|2.<space|2spc>Data
      Abstraction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-6><vspace|0.5fn>

      2.1 Specifying Data via Interfaces <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      2.2 Representation Strategies for Data Types
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      2.3 Interfaces for Recursive Data Types
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>

      2.4 A Tool for Defining Recursive Data Types
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      2.5 Abstract Syntax and Its Representation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|3.<space|2spc>Expressions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-12><vspace|0.5fn>

      3.1 Specification and Implementation Strategy
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>

      3.2 LET: A Simple Language <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>

      3.3 PROC: A Language with Procedures
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>

      3.4 LETREC: A Language with Recursive Procedures
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>

      3.5 Scoping and Binding of Variables
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>

      3.6 Eliminating Variable Names <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>

      3.7 Implementing Lexical Addressing
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|4.<space|2spc>State>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-20><vspace|0.5fn>

      4.1 Computational Effects <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>

      4.2 EXPLICIT-REFS: A Language with Explicit References
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>

      4.3 IMPLICIT-REFS: A Language with Implicit References
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>

      4.4 MUTABLE-PAIRS: A Language with Mutable Pairs
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>

      4.5 Parameter-Passing Variations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|5.<space|2spc>Continuation-Passing
      Interpreters> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-26><vspace|0.5fn>

      5.1 A Continuation-Passing Interpreter
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>

      5.2 A Trampolined Interpreter <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>

      5.3 An Imperative Interpreter <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>

      5.4 Exceptions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>

      5.5 Threads <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|6.<space|2spc>Continuation-Passing
      Style> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-32><vspace|0.5fn>

      6.1 Writing Programs in Continuation-Passing Style
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>

      6.2 Tail Form <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>

      6.3 Converting to Continuation-Passing Style
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>

      6.4 Modeling Computational Effects <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|7.<space|2spc>Types>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-37><vspace|0.5fn>

      7.1 Values and Their Types <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>

      7.2 Assigning a Type to an Expression
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>

      7.3 CHECKED: A Type-Checked Language
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>

      7.4 INFERRED: A Language with Type Inference
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|8.<space|2spc>Modules>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-42><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|9.<space|2spc>Objects
      and Classes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-43><vspace|0.5fn>

      9.1 Object-Oriented Programming <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>

      9.2 Inheritance <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>

      9.3 The Language <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46>

      9.4 The Interpreter <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47>
    </associate>
  </collection>
</auxiliary>