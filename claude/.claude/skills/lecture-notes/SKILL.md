---
name: lecture-notes
description: Transcribe lecture material (handwritten/blackboard PDFs, slides, photos, dictation) into study-friendly LaTeX lecture notes in Maximilian's relaxed transcript style, using the notes template. Use when the user wants to type up, transcribe or continue lecture notes / a "Skript" / "Mitschrift" for a course, or add a new lecture to existing notes.
---

# Lecture notes (relaxed transcripts)

Goal: notes that are pleasant to **study** from and that say **exactly what the
lecturer said**, typeset cleanly. These are the user's lecture transcripts; the
formal style in `uni/CLAUDE.md` is for the thesis and their own writing, not for this.

## Setup

- New course: create `/Users/mf/dev/latex/uni/<course-name>/`, copy
  `/Users/mf/dev/latex/templates/notes.tex` to `<topic>.tex` (lowercase), fill in
  `\lecturetitlepage{Lecturer}{TITLE IN CAPS}{Semester}`. Unknown lecturer →
  `\TODO[lecturer]`. Uncomment topic packages only if needed; course notation
  goes into the "Course" block (`\DeclareMathOperator`, `\newcommand`).
- Existing course: append to the main file; never restructure earlier lectures
  unless asked.
- German course: `ngerman` class option, `\usepackage{babel}`, German theorem
  names, `\crefname{theorem}{Satz}{Sätze}`, and in the template's title-page block
  `Getippt von` / `Universität Wien` (see comments there).
- Reference: `/Users/mf/dev/latex/uni/numerics-of-pdes/numpde.tex` is a finished
  example of this style next to its source PDF (`test for claude.pdf`).

## The one rule: follow the lecturer

Transcribe, don't rewrite. Keep the lecturer's
- **wording**, including fragments ("$\Omega$ open set in $\R^n$"), abbreviations
  (s.t., a.e., i.e., Ex., wlog, op., equiv.) and their language quirks;
- **order** of ideas, line breaks that carry meaning, and their headings
  (red/green/underlined headings → `\section`/`\subsection`/`\subsubsection*` by
  level);
- **notation**, even if unusual: their symbols for inner products, norms, sup
  ess, their letters and indices;
- **arrows and shorthand**: $\implies$, $\iff$, $\to$, $\forall$/$\exists$ inside
  sentences, a formula starting a sentence; all fine. Only arrows that point at
  something to define it are rewritten (see "Arrows that define");
- **punctuation of displays only where the board has it**: no added periods or
  commas after formulas.

Never invent content: no added steps, proofs, definitions, explanations or
corrections. If something is unreadable, ambiguous, seems wrong, or a proof was
skipped: `\TODO[what is unclear]` (e.g. `\TODO[lecturer wrote $\alpha_0$?]`,
`\TODO[proof skipped]`). Never log TODOs elsewhere; the red marker is enough.

## Boxes: formal or just coloured

Every definition, result, example and remark goes into a box in the colour of
its kind. Decide the kind by content, then formal or informal:

| Kind | Colour | Formal (with heading) | Informal (colour only) |
|---|---|---|---|
| result: theorem, inequality, identity, embedding, fact, consequence | red | `theorem*`, `lemma*`, `proposition*`, `corollary*` | `thmbox` |
| definition: new term, space, norm, operator, notation | blue | `definition*` | `defbox` |
| example | yellow | `example*` | `exbox` |
| remark, side comment | violet | `remark*` (grey: `note`) | `rembox` |

- **Formal** when the lecturer labels it ("Def.", "Thm.", "Satz", "Lemma",
  "Prop.", "Cor.", "Ex.:", "Example:", "Remark:", "Note:"), or when a board
  heading introduces exactly this one statement (heading "The
  Poincaré–Friedrichs inequality" → `theorem*` below it; the heading stays). The
  label decides theorem/lemma/…; without a label use `theorem*`. Drop the label
  word and a bullet in front of it: the environment prints the heading.
- **Informal** for everything else of that kind: notation ("Multiindex …"),
  lists of spaces and norms ("$C^k(\Omega) = $ set of …", "Norm: …"), single
  formula lines, facts and consequences ("Distributions are differentiable
  infinitely many times.", "Consequence: …"), examples given as a sentence
  ("Example of distribution that is not a function: …"). The content stays as
  it is, bullets included.
- **No box**: proofs, arguments, computations, motivation ("We want to define
  $D^\alpha u$ …"), the lecturer's questions.
- One block, one box, never nested. A definition made inside a result or remark
  ("we set …", Heaviside's $H$ inside a remark) stays in that block and takes
  its colour. When the kind changes inside a bullet list (an "Ex.:" under a
  definition), close list and box and start the next box.
- Starred (unnumbered) by default; numbered + `\label` + `\cref` only when the
  lecturer refers back.
- Displays need nothing: every amsmath display gets a thin frame, in the box
  colour inside a box and grey outside.
- Something the lecturer framed on the board → `keybox` (chalk-white frame; its
  displays stay unframed).

## Mapping board → template (everything else)

| On the board | In LaTeX |
|---|---|
| "Proof:" … □ | `proof`, `\qedhere` if it ends in a display |
| framed / highlighted key formula | `keybox` (`[chalkorange]` etc. for another colour) or `\boxed{}`/`\fbox{}` (inline) |
| bullet points | `itemize`; arrow bullets → `arrows` list |
| i), ii) / (a), (b) | `enumerate` with `[label=\roman*)]` etc., as on the board |
| a new lecture/date | `\lecture[DD.MM.YYYY]` (or `\lecture` if no date) |
| (∗), (1) markers | `\tag{$\ast$}` |
| coloured heading inside text/bullet ("Support of $u$") | `\boardhead{...}` |
| emphasis, underlined words | `\emph{}`; key phrases that act as headings `\boardhead{}` |
| side questions, asides | `\begin{center} ... \end{center}` or in parentheses, as on the board |
| arrow pointing at a term to define or explain it | the term on its own line with its definition (below) |

### Arrows that define

An arrow from a term to its explanation ($\hookrightarrow$, $\uparrow$,
$\curvearrowleft$, …) is hard to read in print. Write the element it points at
instead of the arrow, so the line reads on its own; add nothing else:

- under the heading $L^1_\loc(\Omega) \subset \mathcal{D}'(\Omega)$:
  "$\hookrightarrow$ integrable functions in every compact $K$" →
  "$L^1_\loc(\Omega)$: integrable functions in every compact $K$"
- under the formula for $\delta_{x_0}$: "$\uparrow$ Dirac's delta" →
  "$\delta_{x_0}$: Dirac's delta"
- "min of all real numbers $M$ s.t. $\curvearrowleft$" (pointing back at a
  condition) → copy the condition: "… s.t. $\abs{u(x)} \leq M$ a.e. in $\Omega$"
- "$\hookrightarrow (\norm{\gamma u} \leq C \norm{u})$" pointing at "continuous"
  → "($\gamma$ continuous: $\norm{\gamma u} \leq C \norm{u}$)"

## Theme

Blackboard theme: dark grey board with a dotted 5 mm grid, off-white chalk
text. Colours carry meaning:
- headings: section red, subsection orange, `\subsubsection*` teal,
  `\boardhead` red;
- boxes: red results, blue definitions, yellow examples, violet remarks, grey
  notes, `keybox` chalk-white;
- displays: grey frame, or the colour of their box.

Don't colour anything else. If a word must keep the lecturer's chalk colour,
use `\textcolor{chalkgreen}{...}` or `chalkteal`, sparingly, never a box colour.
Use the palette names (`chalkred`, `chalkorange`, `chalkyellow`, `chalkgreen`,
`chalkteal`, `chalkblue`, `chalkviolet`, `chalkgrey`, `chalk`), never raw
`red`/`blue`, so the print version (comment out `\blackboardtrue`) stays
readable. Images with white background look patchy on the board; mention it to
the user.

## Typesetting still applies

Relaxed wording, clean typesetting:
- macros from the template: `\R`, `\N`, `\abs{}`, `\norm{}`, `\set{x \given ...}`,
  `\iprod{}`; they print the same symbols as on the board. Larger delimiters with
  `\norm*{}`/`\Bigl(`…`\Bigr)`, not `\left`/`\right`;
- `\coloneqq`, `f\colon X \to Y`, `\,dx`, `\dots`, `\text{...}` for words in math,
  `\DeclareMathOperator` for operators (`\supp`), `\varepsilon`, `\varphi`;
- displays: `equation*`, `align*`, `alignat*`, `gather*`, `multline*`, `cases`;
  never `$$` (not framed); no `\\` after the last line;
  `\enquote{}` for quotes;
- source: 2-space indentation, one paragraph per line, no `\\` to end paragraphs;
- abbreviations need no `\ ` (the template sets `\frenchspacing`).

## Workflow

1. Read the source completely first (PDF: all pages; long PDFs in chunks of
   ~10 pages). Note headings, labels, colours, frames, dates and anything
   unreadable.
2. Transcribe in order, a few pages at a time, appending to the file; box each
   block as in "Boxes".
3. Build and format with the commands from "Toolchain" in
   `/Users/mf/dev/latex/CLAUDE.md`, then sync Skim to the new part (`displayline`,
   same section). Done only with **no errors and no warnings**; fix overfull
   boxes by breaking lines the way the board does (`\\` in `align*`/`gather*`,
   `aligned` inside `\set*`, `\allowbreak`), never by shrinking fonts.
4. Proofread against the source page by page: every formula, index, sign and
   quantifier; nothing added, nothing missing. Render with `pdftoppm -r 80 -png`
   and look at the pages.
5. Report to the user: what was transcribed (pages/lectures), the remaining
   `\TODO`s, any interpretation you had to make and box decisions that were
   close calls.
