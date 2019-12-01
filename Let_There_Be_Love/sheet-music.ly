\version "2.18.2"

\header {
  title = "Let There Be Love"
  subtitle = #(if (not (ly:get-option 'compact)) "A Song of the New Day" "")
  composer = #(if (not (ly:get-option 'compact)) "Daniel Speyer" "")
  copyright = #(if (not (ly:get-option 'compact)) "CC-SA-BY" "")
}


#(set! paper-alist (cons '("my size" . (cons (* 8.5 in) (* 14 in))) paper-alist))

%\paper {
%  #(set-paper-size "my size")
%}

words = \lyricmode {
Though all our kind may die some day,
Let there be love.
Though flesh and steel e -- rode a --way,
Though hea -- vy be the price to pay,
Let there be love.

Let there be a love of beau -- ty.
Let there be a love of truth.
Let there be a love for men -- tors.
Let there be a love for youth.

Let there be a love of just -- ice.
Let there be a love of love.
Let there be a love for strang -- ers,
And for those our tribe is of.

Though eve -- ry star grow dim and cold,
Let there be love.
Though ang -- er last an age un -- told,
Though fear- -- of- -- death it -- self wane old,
Let there be love.

Let each car -- bon form an ax -- on; let it love.
Let each i -- on cross a mem -- brane; let it love.
Let the si -- li -- con and cop -- per form a cir -- cuit with each oth -- er; let them love.
Let them be loved.

Let each pho -- ton bridge a dis -- tance; let it love.
Let neu -- tri -- nos form a net -- work; let them love.
Let the yet  un -- nammed dark mat -- ter find a way to flirt and chat -- ter; let it love.
Let it be loved.

As we grow in -- to our pow -- er,
Let us love.
At an -- thro -- po -- cene's first ho -- ur,
As our works be -- gin to flow -- er,
Let us love.

Here we stand with our am -- bi -- tion;
At this be -- gin -- ning we all say:
Let there be love!
}

themea = \relative c' {
  c4 f g g g a a f
  g4 f b, c2 ~ c2
  r4 c4 \break f4. g8 g4 g a4. a8 f4
  r8 d g4. a8 a4 a b2 b8 a r4
  g4 f b,2 c1 ~ c2 
}

themeav = \relative c' {
  c4 f g2 \tuplet 3/2 { g4 g g } a8 g  r4
  g4 b, c1 ~ c2 \break
  c4 f4 g2 \tuplet 3/2 { g4 g g } a8 g4.
  d4 f a2 \tuplet 3/2 { a4 a a} b8 a r4
  g4 b, c1 ~ c2 
}

themeb = \relative c' {
  c8 f a2
  \tuplet 3/2 {a4 a a}
  b4 a4
  r4 c,8 f a2
  \tuplet 3/2 {a4 a g}
  b4
}

themebv = \relative c' {
  c8 f b2.
  \tuplet 3/2 {b8 b b}
  c4 b4
  r4 c,8 e g2.
  \tuplet 3/2 {g8 g f}  \break
  g4
}

themec = \relative c' {
  c4 e g4. f8 g4. f8 g4. f8 g4 f c1 ~ c2
  c4 f a4. g8 a4. g8 a4. g8 a4 f c1 ~ c2
  a'4 g f8 f4. g f8 e e4. f e8 d d4. f e8 c c4.
  g'4 b, c1 ~ c4
  g' f b,4 c1 ~ c2
}

themed = \relative c'' {
  g4 f e4. e8 f4 e d8 d4. g8 f e4 d8 d4. g4 f e2
  r2 r1
  g2 f b, c ~ c1
  
}

\score {
  <<
    \new Voice = "melody" {
      \set Staff.midiInstrument = #"voice oohs"
      \tempo 4 = 120
      r2.
      \themea r4
      \themeb r2
      \themeb r2
      \themebv r2
      \themebv r2
      \themea
      r2 \break r2
      \themec
      \themec
      r2 \break r2
      \themeav
      \themed
    }
    \new Lyrics = "va" \lyricsto "melody" {
      \words
    }
  >>
  \layout {}
  \midi {}
}
