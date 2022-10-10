\version "2.18.2"

\header {
  title = "Let There Be Love"
  subtitle = #(if (not (ly:get-option 'compact)) "A Song of the New Day" "")
  composer = #(if (not (ly:get-option 'compact)) "Daniel Speyer" "")
  copyright = #(if (not (ly:get-option 'compact)) "CC-SA-BY" "")
}


#(set! paper-alist (cons '("my size" . (cons (* 8.5 in) (* 14 in))) paper-alist))

\paper {
  #(set-paper-size "my size")
}


#(if (ly:get-option 'nopiano) (set-global-staff-size 17))


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
  r4 c4  f4. g8 g4 g a4. a8 f4
  r8 d g4. a8 a4 a b2 b8 a r4
  g4 f b,2 c1 ~ c2 
}

harma = {
  \chordmode {
    a,,4:1.3-.6- f,,2 e,,:m c,,:1.4.6 f,, g,,:1.4.7 c, s2.
    a,,4:1.3-.6- f,,2 e,,:m c,,:1.4.6
    f,, g,, f,, e,,:m g,, g,,:1.4.7 g,,:1.3.6 c,1 ~ c,2
  }
}

deca = \relative c {
  s1*3 s4 a8 b f' e8 r4
}

themeav = \relative c' {
  c4 f g2 \tuplet 3/2 { g4 g g } a8 g  r4
  g4 b, c1 ~ c2 
  c4 f4 g2 \tuplet 3/2 { g4 g g } a8 g4.
  d4 f a2 \tuplet 3/2 { a4 a a} b8 a r4
  g4 b, c1 ~ c2 
}

harmav = {
  \chordmode {
    f,,2:7+ f,,2 e,,:m c,,:1.4.6 g,,:1.4.7 c, s2 s2
    f,,2:7+ f,,2 e,,:m c,,:1.4.6
    f,, g,, f,, e,,:m  g,,:1.4.7 c,2 s1
  }
}


themeb = \relative c' {
  c8 f a2
  \tuplet 3/2 {a4 a a}
  b4 a4
  r4 c,8 f a2
  \tuplet 3/2 {a4 a g}
  b4
}

harmb = {
  \chordmode {
    c,4:1.4.6  f,,1 b,,,2.:1.4.6-
    c,4:1.4.6  f,,1 b,,,2.:1.4.6-
  }
}

themebv = \relative c' {
  c8 f b2.
  \tuplet 3/2 {b8 b b}
  c4 b4
  r4 c,8 e g2.
  \tuplet 3/2 {g8 g f}  
  g4
}


harmbv = {
  \chordmode {
    c,4:1.4.6  g,,1 c,,2.:1.4.6
    c,4:1.4.6  g,,1 c,,2.:1.3.5.8
  }
}

themec = \relative c' {
  c4 e g4. f8 g4. f8 g4. f8 g4 f c1 ~ c2
  c4 f a4. g8 a4. g8 a4. g8 a4 f c1 ~ c2
  a'4 g f8 f4. g f8 e e4. f e8 d d4. f e8 c c4.
  g'4 b, c1 ~ c4 
  g' f b,4 c1 ~ c2
}

harmc = {
  \chordmode {
    a,,2:m c,, e,,:m g,, b,,:1.4.6- c,, s s
    a,,2:m d,,:m f,, a,,:m a,,:1.5.8 c,, s s
    a,,2:m f,, d,,:1.4.6 e,,:m d,,:m d,,:1.4.6 d,,:m c,, e,,:m c,,1 e,,:m c,, ~ c,,2
    
  }
}

decc = {
  s1*3 r4 a,8 b, f4 e8 r
  s1*3 r4 a,8 b, f4 e8 r
}

themed = \relative c'' {
  g4 f e4. e8 f4 e d8 d4. g8 f e4 d8 d4. g4 f e2
}
themee = \relative c'' {
  g2 f b, c ~ c1
  
}

harmde = {
  \chordmode {
    g,2 e,,:m f, f,,:1.4+.6 g, b,,:1.3-.5- f,  b,,1:1.4.6- ~ b,,1:1.4.6-
    g,,2 f,, b,,,:1.4.6- c,,:1.3.5.8 ~ c,,1:1.3.5.8 
  }
}

\score {
  <<
    \new ChordNames \with {
      \consists "Instrument_name_engraver"
      instrumentName = #"Guitar"
      shortInstrumentName = #"G"
    } {
      \chordmode { c,1 c,2.:1.4.6 }
      \harma 
      \chordmode {  c,2 ~ c,2. }
      \harmb 
      \harmb 
      \harmbv
      \harmbv 
      \chordmode {  b,,,4:1.4.6-.8 ~ b,,,2.:1.4.6-.8 }
      \harma
      \chordmode {  a,,2:1.3-.5.7 ~ a,,2:1.3-.5.7 }
      \harmc
      \harmc 
      \chordmode { c,,2:1.3.5.8 a,,2:m }
      \harmav
      \harmde	
    }

    \new Voice = "melody" {
      \set Staff.instrumentName = #"Voice"
      \set Staff.shortInstrumentName = #"V"
      \set Staff.midiInstrument = #"voice oohs"
      \tempo 4 = 120
      r1 r2.
      \themea r2 r2.
      \themeb r2
      \themeb r2
      \themebv r2
      \themebv r2. r
      \themea
      r2  r2
      \themec
      \themec
      r2  r2
      \themeav
      \themed
      r2 r1
      \themee	
    }
    \new Lyrics = "va" \lyricsto "melody" {
      \words
    }
    
    #(if (not (ly:get-option 'nopiano)) #{
      \new PianoStaff <<
        \new Voice {
          \set Staff.midiInstrument = #"acoustic grand"
          \set PianoStaff.instrumentName = #"Piano"
          \set PianoStaff.shortInstrumentName = #"P"
          \set Staff.midiMinimumVolume = #0.6
          \set Staff.midiMaximumVolume = #0.8
          r2 g'8 f' b4  g''8 f'' b'4 r
          \themea
          g'4. f'8 g'8 f'8 b4 r
          \themeb r2
          \themeb r2
          \themebv r2
          \themebv g'4 g'4. b'8 b2.
          \themea
          e'8 f' c''4  b'2
          \themec
          \themec
          c'2  c''2
          \themeav
          \themed
          e'8 r4. e'8 r4. e'8 r4. 
          \themee
        }
        \new Voice {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.6
          \set Staff.midiMaximumVolume = #0.8
          \clef bass
          \chordmode { c,1 c,2.:1.4.6 }
          << \harma \deca >>
          \chordmode {  c,2 ~ c,2. }
          \harmb 
          \harmb 
          \harmbv
          \harmbv 
          \chordmode {  b,,,4:1.4.6-.8 ~ b,,,2.:1.4.6-.8 }
          << \harma \deca >>
          \chordmode {  a,,2:1.3-.5.7 ~ a,,2:1.3-.5.7 }
          << \harmc \decc >>
          << \harmc \decc >>
          \chordmode { c,,2:1.3.5.8 a,,2:m }
          << \harmav { \deca s1*2 \deca }>>
          \harmde	
        }
      >>
    #} )
  >>
  \layout {}
  \midi {}
}