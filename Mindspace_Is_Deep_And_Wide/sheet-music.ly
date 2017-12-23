\version "2.18.2"

\header {
  title = "Mindspace is Deep and Wide"
  composer = "Raymond Arnold"
}

wca = \lyricmode {
  There’s a lot -- ta ways that you can op -- ti -- mize  (Mind -- space is Deep and Wide!)
  One of those ways is to be a mind  (Mind -- space is Deep and Wide!)
  But that ain’t nar -- row e -- nough for me  (Mind -- space is Deep and Wide!)
  Minds are big -- ger than the sea    (Mind -- space is Deep and Wide!)
}

wva = \lyricmode {
  Lot -- ta ways  to  think!  (Lot -- ta ways to think!)
  Lot -- ta ways to feel! (Lot -- ta ways to feel!)
  Lot -- ta ways to de -- cide! (Lot -- ta ways to de --  cide!)
  Mind -- space is deep and wide
}

wcb = \lyricmode {
  There’s a lot -- ta ways to self _ mod -- i -- fy  (Mind -- space is Deep and Wide!)
  Lot -- ta rea -- sons you may want to try  (Mind -- space is Deep and Wide!)
  But that’s all just the _ tip ofthe ‘berg  (Mind -- space is Deep and Wide!)
  Some -- times minds get pretty ab -- surd  (Mind -- space is Deep and Wide!)
}

wvb = \lyricmode {
  You could be a crust -- a -- cean (be a crust -- a -- cean)
  Or an em -- u -- la -- tion (or an em -- u -- la -- tion)
  Or an A G I (or an A G I)
  Mind -- space is deep and wide
}

wcc = \lyricmode {
  Lot -- ta val -- ues _ _ _ that you could prize   (Mind -- space is Deep and Wide!)
  Lot -- ta things to try an’ max -- i -- mize   (Mind -- space is Deep and Wide!)
  But some -- times minds are _ blindto their goals  (Mind -- space is Deep and Wide!)
  Hard time peer -- ing into your soul  (Mind -- space is Deep and Wide!)
}

wvc = \lyricmode {
  You could care a -- bout bab -- ies (care a -- bout bab -- ies) 
  Pa -- per -- clips _ may -- be (pa -- per -- clips _ may -- be)
  Stay -- in’ _ a -- live (stay -- ing _ a -- live)
  Mind -- space is deep and wide
}

wcd = \lyricmode {
  Gotta be care -- ful _ _ _ what you as -- sume  (Mind -- space is Deep and Wide!)
  Ty -- pi -- cal mind could _ be your doom  (Mind -- space is Deep and Wide!)
  But I hope that you have come to see  (Mind -- space is Deep and Wide!)
  Minds are as big as infin -- ity  (Mind -- space is Deep and Wide!)
}

wvd = \lyricmode {
  Mind -- space is deep... and wide...
}  

vocal = \relative c' {
  \clef "treble_8"
  \time 4/4
  \numericTimeSignature
  \repeat volta 3 {
    r2 a4 a c2. d4 d d d d e2. c4 d2 r
    a2 a4 a e e a r
    a2 a4 a a2 a4 a f2. f4 a2 r
    a a4 a e e a
    a a2. c4 d2 d4 d e2. c4 d2 r
    a a4 a e e a r
    a4. a8 a4 a f c e2
    a a4 a e e a r
  }
  \set Score.repeatCommands = #'((volta "1."))
    r2. a8 a c2. d4 e2. 
    a,8 a c2. d4 e2. 
    a,8 a f2. c4 e2.
    a8 a f2. c4 e2.
    f8 f e2. e8 a, c2.
    f8 f e2. e8 a, c2. r4
    a'2 a4 a e e a r

  \set Score.repeatCommands = #'((volta "2,3"))
    r2. a8 a c4 c d2 e2. d4 
    c4 c d2 e2. d4
    e e c c d2 a4 r
    e' e c c d2 a4 r
    d d c e, a
    d4 d c e, a r2
    a2 a4 a e e a r

  \set Score.repeatCommands = #'((volta "4"))

    a2 a4 a e2. e4 a1
    
  \set Score.repeatCommands = #'((volta #f))

}

\score {
  <<
    \new Voice = "v" {
      \tempo 4 = 120
      \set Staff.instrumentName = #"VOICE"
      \set Staff.midiInstrument = #"voice oohs"
      \vocal
    }
    \new Lyrics \lyricsto "v" {
      <<
        \wca
        \new Lyrics = "c2"
          \with { alignBelowContext = #"v" } {
          \set associatedVoice = "v"
          \wcb
        }
        \new Lyrics = "c3"
        \with { alignBelowContext = #"c2" } {
          \set associatedVoice = "v"
          \wcc
        }
        \new Lyrics = "c4"
        \with { alignBelowContext = #"c3" } {
          \set associatedVoice = "v"
          \wcd
        }
      >>
      \wva
      <<
         \new Lyrics = "v2" {
           \wvb
         }
         \new Lyrics \with { alignBelowContext = #"v2" } {
           \wvc
         }
      >>
      \wvd
    }
  >>
  \layout {}
}