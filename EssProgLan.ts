<TeXmacs|2.1.1>

<style|source>

<\body>
  <\active*>
    <\src-title>
      <src-style-file|Modified from tmbook|1.0>

      <\src-purpose>
        A future style for <TeXmacs> books.
      </src-purpose>

      <\src-copyright|1998--2004>
        Joris van der Hoeven
      </src-copyright>

      <\src-license>
        This software falls under the <hlink|GNU general public license,
        version 3 or later|$TEXMACS_PATH/LICENSE>. It comes WITHOUT ANY
        WARRANTY WHATSOEVER. You should have received a copy of the license
        which the software. If not, see <hlink|http://www.gnu.org/licenses/gpl-3.0.html|http://www.gnu.org/licenses/gpl-3.0.html>.
      </src-license>
    </src-title>
  </active*>

  <use-package|book|vdh>

  <\active*>
    <\src-comment>
      Headers.
    </src-comment>
  </active*>

  <assign|odd-page-text|<macro|s|<assign|page-odd-header|<quasiquote|<small|<style-with|src-compact|none|<wide-std-underlined|<with|font-shape|small-caps|<unquote|<arg|s>>><htab|5mm><unquote|<page-number>>>>>>>>>

  <assign|even-page-text|<macro|s|<assign|page-even-header|<quasiquote|<small|<style-with|src-compact|none|<wide-std-underlined|<unquote|<page-number>><htab|5mm><with|font-shape|small-caps|<unquote|<arg|s>>>>>>>>>>

  <\active*>
    <\src-comment>
      Chapters.
    </src-comment>
  </active*>

  <assign|sectional-sep|<macro|.<space|2spc>>>

  <assign|sectional-post-sep|<macro|<space|2spc>>>

  <assign|chapter-text|<macro|>>

  <assign|chapter-title|<macro|name|<style-with|src-compact|none|||<new-dpage*><new-line><sectional-normal|<vspace*|4fn><arg|name><vspace|3fn>>>>>

  <assign|chapter-long-title|<macro|first-title|second-title|<style-with|src-compact|none|<chapter-title|<style-with|src-compact|none|<with|font|Bbb|font-size|2.5|<arg|first-title>><hspace|0.5fn><em|<large|<arg|second-title>>>>>>>>

  <assign|chapter-numbered-title|<macro|title|<style-with|src-compact|none|<chapter-long-title|<the-chapter>|<arg|title>>>>>

  <assign|appendix-numbered-title|<macro|title|<style-with|src-compact|none|<chapter-long-title|<appendix-text>
  <the-appendix>|<arg|title>>>>>

  <\active*>
    <\src-comment>
      Sections, subsections and subsubsections.
    </src-comment>
  </active*>

  <assign|section-title|<\macro|name>
    <sectional-normal-bold|<hspace|0.5fn><vspace*|2fn><arg|name><vspace|1fn>>
  </macro>>

  <assign|subsection-title|<macro|name|<style-with|src-compact|none|<sectional-normal-bold|<vspace*|1.5fn><arg|name><vspace|0.5fn>>>>>

  <assign|subsubsection-title|<macro|name|<style-with|src-compact|none|<sectional-normal-bold|<vspace*|1fn><arg|name><vspace|0.5fn>>>>>

  <\active*>
    <\src-comment>
      EssProgLan
    </src-comment>
  </active*>

  <assign|50bright|#808080>

  <assign|25bright|#404040>

  <assign|30bright|#4c4c4c>

  <assign|verbatim|<macro|body|<with|font-family|tt|font-size|0.9|color|<value|50bright>|language|verbatim|<arg|body>>>>

  <assign|scm|<macro|body|<with|mode|prog|prog-language|scheme|font-family|rm|font-size|0.9|color|<value|50bright>|<arg|body>>>>

  <assign|section-sep| >

  <assign|exercise-sep| >

  <assign|render-exercise|<\macro|which|body>
    <\padded>
      <\indent-left|<value|exercise-indentation>>
        <surround|<exercise-name|<arg|which><exercise-sep>>|<yes-indent*>|<arg|body>>
      </indent-left>
    </padded>
  </macro>>

  <assign|solution*|<\macro|body>
    <\render-exercise|<with|color|<value|25bright>|<localize|Solution:>>>
      <with|color|<value|30bright>|<arg|body>>
    </render-exercise>
  </macro>>

  <\active*>
    <\src-comment>
      Some costums
    </src-comment>
  </active*>

  <assign|p|<macro|body|<with|par-left|1.3tab|<arg|body>>>>

  <assign|pair|<macro|body|<verbatim|(><with|||<arg|body>><verbatim|)>>>

  <assign|frame|<\macro|body>
    <tabular|<tformat|<cwith|1|1|1|1|cell-lborder|1ln>|<cwith|1|1|1|1|cell-rborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|2ln>|<table|<row|<cell|<verbatim|<arg|body>>>>>>>
  </macro>>

  <assign|exercise|<\macro|body>
    <with|par-left|0.5fn|<surround|<compound|next-exercise>|<vspace|1.2fn>|<compound|render-exercise|<compound|exercise-numbered|<compound|exercise-text>|<compound|the-exercise>>|<arg|body>>>>
  </macro>>

  <\active*>
    <\src-comment>
      Other customization.
    </src-comment>
  </active*>

  <assign|theorem-name|<macro|name|<with|font-shape|small-caps|<arg|name>>>>

  <assign|toc-strong-2|<macro|left|right|<style-with|src-compact|none|<vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|<arg|left>><toc-dots><arg|right><vspace|0.5fn>>>>
</body>

<\initial>
  <\collection>
    <associate|preamble|true>
    <associate|src-style|scheme>
  </collection>
</initial>