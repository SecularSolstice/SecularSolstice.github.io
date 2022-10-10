\version "2.18.2"

\header {
  title = "Walk With Me"
  subtitle = "A Song of Evening"
  composer = "Daniel Speyer"
  arranger = "Based on 'Here Comes the Rain Again' by the Eurythmics"
  copyright = "Original (c) Eurythmics, used fairly under Campbell v. Acuff-Rose Music, Inc. 1994 -- New parts CC-SA-BY"
}

vocal = \relative c' {
  \numericTimeSignature
  r4 a4 b c
  \repeat volta 2 {
  g' c,8 c4. r4 
  r2 r4 c b8 c4 c8~ ~c2 r1
  g'4 c,8 c4. r4
  r2 r4 e b8 c4 c8~ ~c2 r1
  r4 a b c
  g'4 c,8 c4. r4
  r2 r4 f f8 e4 e8.( d16 c4.)
  }
  \alternative { {
  r1 r r r r
  r4 c c c8 c8~ ~c4 b8 b4. r4
  c8 c c c c4 c8 c c b4 a4. r4
  c8 c c c c4 c8 c c4 a8 b4 c4.
  r1 r1
  r8 c c c c4 c8 c c4 b8 b4. r4
  r8 c c c c4 c c8 b4 b4. r4
  c8 c c4 c8 c c c8~ ~c8 b4.
  r8 a8 b4 b4. c4 c c8~ ~c4
  a4 b c
  } {
    r1
    g'4 c,8 c8 r2
    g'4 c,8 c8 r2
    g'4 c,8 c8 r2
    r2 r4 c g'8 r c, c c2    
    r1
  } } 
}

violin = \relative c'' {
  \numericTimeSignature
  %g'4 e c b~ b r2. 
  <a c>2 r
  \repeat volta 2 {
  r1 g'4 c,8 c4 r4. r1
  b8 c4 c4. r4 r1
  g'4 c,8 c4. r4
  r1 b8 c4 c4. r4
  c1 g'
  g4 c,8 c4. r4
  r1
  }
  \alternative {{
  f8 e4 e8. d16 c4.
  a'8 r d, d d2~ d~ d8 d d d'
  d g, g g~ g2
  r2. b16 a e c
  c1 r c r c
  b8 c b c b c b c 
  b8 c b c b c b c 
  b'8 c b c b c
  b,16 c e g
  c,1~ c2. r4 c1~c2. r4
  c1 r2 r8 a b4 c1 r 
                }{
  f8 e4 e8.( d16 c4.)
  g'1 e c
  g'8 r c, c c2
  r1 r
  }}
}

rp = \relative c' {
  \numericTimeSignature
  r4 a4 b c
  \repeat volta 2 {
  << {<c g>4 c8 c8~ c2~ c2.} \\ {a1~ a2.} >>
  <a c>4 << {b8 c4 c8~ c2~ c1} \\ {<g e'>1~ <g e'>} >>
  << {<c g'>4 c8 c8~ c2~ c2.} \\ {a1~ a2.} >>
  <c e>4 << {b8 c4 c8~ c2~ c1} \\ {<g e'>1~ <g e'>} >>
  a1
  << {<c g'>4 c8 c8~ c2~ c2.} \\ {<g e'>1~ <g e'>2.} >>
  f'4 << {f8 e4 e8.( d16 c4.)} \\ {<g c>1} >>
  }
  \alternative { {
  <c c'>4. <b b'>4. <g g'>4
  <a' a'>8 r8 <d, d'> <d d'>~ <d d'>2~ <d d'>2~ <d d'>8 d' d d'
  <d d,> <g,, g'> <g g'> <g g'>~ <g g'>2 <g' b>2. b,16 a e c
  r4 c c c8 c8~ ~c4 b8 b4. r4
  c8 c c c c4 c8 c c b4 a4. r4
  c8 c c c c4 c8 c c4 a8 b4 c4.
  b8 c b c b c b c b' c b c b c b,16 c e g
  b,8 c c c c4 c8 c c4 b8 b4. r4
  r8 c c c c4 c c8 b4 b4. r4
  c8 c c4 c8 c c c8~ ~c8 b4.
  r8 a8 b4 b4. c4 c c8~ ~c4
  a4 b c
  } {
    <g c>1 
    <<
      {r2 g'4 c,8 c8
       r2 g'4 c,8 c8 
       r2 g'4 c,8 c8} \\
      {a1 a1 a1}
    >>
    g1 d'
    <a c e>
  } }
} 

lp = \relative c {
  \numericTimeSignature
  r4 r8 g g g a a
  \repeat volta 2 {
  \repeat unfold 16 { f }
  \repeat unfold 16 { c }
  \repeat unfold 16 { f }
  \repeat unfold 16 { c }
  \repeat unfold 16 { f }
  \repeat unfold 16 { c }
  }
  \alternative {{
  \repeat unfold 16 { d }
  \repeat unfold 16 { g }
  g4 r r2
  a8 a a g g g a a
  r r r g g g a a
  f f f g g g a a 
  r r r g g g a a
  a a a g g g a a
  r r r f f f g g   
  a a a g g g a a
  r r r g g g a a
  a a a g g g a a
  r r r g g g a a
  f f f g g g a a 
  r r r g g g a a
  g g g f f f g g 
  r r r f f f g g 
  a a a g g g a a
  r r r g g g a a
                }{
  \repeat unfold 16 { f }
  \repeat unfold 12 { c }
  r2 r1 r1 <a' c e>
  }}
}

guitar = \absolute {
  \chordmode{
    s1
    \repeat volta 2 {
      f,  s c, s f, s c, s s c, s f, 
    }
    \alternative {{
    s d, s g, s
    a,:min s f,:9 s g, s a,:min 
    s s s f,:9 s g, s a,:min s
    } {
    s f, c, f, s s a,:min
    } }
  }
}

words = \lyricmode {
  So strang -- er 
  walk with me
  I'm walk -- ing too
  Walk with me
  We'll jour -- ney through
  And may -- be talk with me
  As part -- ners do
  Here comes the dark a -- gain
  claw -- ing at my heart like a hung -- ry beast
  shut -- ing down my eyes like a flask that's emp -- ty.
  
  I want to walk on the sol -- id ground.
  I want to know what you've been through.
  Want to face what comes to -- ge -- ther.
  I am saf -- er with you.
  
  So strang -- er
  Walk with me
  Talk with me
  Stop with me
  As friends now can do
}

\score {
  <<
    \new ChordNames {
      \guitar
    }
    \new FretBoards {
      \set Staff.instrumentName = #"GUITAR"
      \set Staff.shortInstrumentName = #"G"
            \guitar
    }
    \new Voice = "one" \with {
      \consists "Volta_engraver"
    }
    {
      \tempo 4 = 128
      \set Staff.instrumentName = #"VOICE"
      \set Staff.shortInstrumentName = #"V"
      \vocal
    }
    \new Lyrics \lyricsto "one" {
      \words
    }
    \new Voice {
      \set Staff.instrumentName = #"VIOLIN"
      \set Staff.shortInstrumentName = #"VI"
      \violin
    }
    \new PianoStaff <<
      \set PianoStaff.instrumentName = #"PIANO"
      \set PianoStaff.shortInstrumentName = #"P"
      \new Voice {
          \rp
      }
      \new Voice {
          \clef bass
          \lp
      }
    >>
  >>
  \layout {
    \context {
      \Score
        \remove "Volta_engraver"
    }
  }
}

\score {
  <<
    \unfoldRepeats
    \new Voice = "one" {
      \tempo 4 = 128
      \set Staff.midiInstrument = #"voice oohs"
      \set Staff.midiMinimumVolume = #0.8
      \set Staff.midiMaximumVolume = #1
      \vocal
    }
    \new Lyrics \lyricsto "one" {
      \words
    }
    \unfoldRepeats
    \new Voice {
      \set Staff.midiInstrument = #"violin"
      \set Staff.midiMinimumVolume = #0.8
      \set Staff.midiMaximumVolume = #1
      \violin
    }
    \unfoldRepeats
    \new PianoStaff <<
      \unfoldRepeats
      \new Voice {
          \set Staff.midiMinimumVolume = #0.4
          \set Staff.midiMaximumVolume = #0.6
          \rp
        
      }
      \unfoldRepeats
      \new Voice {
          \set Staff.midiMinimumVolume = #0.4
          \set Staff.midiMaximumVolume = #0.6
          \clef bass
          \lp
        
      }
    \new Voice {
      \set Staff.midiInstrument = #"acoustic guitar (nylon)"
      \set Staff.midiMinimumVolume = #0.7
      \set Staff.midiMaximumVolume = #0.9
      \guitar
    }
    >>
  >>
  \midi { }
}