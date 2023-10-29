\version "2.18.2"

\header {
  title = "Beneath Midwinter Midnight"
  subtitle = "A Song of Night"
  composer = "Raymond Arnold"
}

va = \lyricmode {
  Be -- neath mid -- win -- ter mid -- night moon
  _ Told you I'd be com -- ing soon
  I wish some -- how, I wish you knew
  that you are not a -- lone.

  You are not a -- lone.
}

vb = \lyricmode {
  Be -- neath mid -- win -- ter mid -- night snow
  There's no sign point -- ing where to go
  No sing -- le sign that life could grow
  But still, you're not a -- lone.

  You are not a -- lone.
}

vc = \lyricmode {
  Be -- neath mid -- win -- ter mid -- night sky
  _ Some -- times peo -- ple say good -- bye,
  And no one's here to tell us why
  But we are not a -- lone.

  We are not a -- lone.
}

vd = \lyricmode {
  Be -- neath mid -- win -- ter morn -- ing light
  _ Get -- ting hard to know what's right
  But take my hand and hold on tight
  Cause we are not a -- lone.

  We are not a -- lone
}

coda = \lyricmode {
  No we are not a -- lone
}

melody = \relative c'' {
  \time 2/4
  \repeat volta 4 {
    r4 a c4. b8 a4 g a g b2 \break
    << {r} {s4. \parenthesize d8} >>
    d4. c8 b4 a b8 a4. c2 \break
    r4. d8 d4 c b4. d8 e4 c b2 \break 
    r4 a b4. a8 a4 g4 a2  \break
    r b4. a8 a4 g4 a2 \break
  }
  a b ~ b4 a a2 r8 g4. a2 ~ a
}

harmony = {
  \chordmode {
    a1:m s s2
    d1:m s s2
    e1 s s2
    a1:m s
    a1:m7 s
    a1:m
  }
}

\score {
  <<

    \new ChordNames {
      \set ChordNames.midiInstrument=#"acoustic guitar (nylon)"
      \set ChordNames.midiMaximumVolume=#0.5
      \harmony
    }
    \new Voice = "one" {
      \tempo 4 = 110
      \set Staff.midiInstrument = #"voice oohs"
      \set Staff.midiMinimumVolume = #0.8
      \set Staff.midiMaximumVolume = #1
      \melody
    }
    \new Lyrics = "va"\lyricsto "one" {
      <<
         \va
         \new Lyrics = "v2"
          \with { alignBelowContext = #"va" } {
           \set associatedVoice = "one"
           \vb
         }
      
         \new Lyrics = "v3"
           \with { alignBelowContext = #"v2" } {
             \set associatedVoice = "one"
             \vc
         }
         \new Lyrics = "v4" 
         \with { alignBelowContext = #"v3" } {
           \set associatedVoice = "one"
           \vd
         }
       >>
      \coda
    }
  >>
  \layout {}
  \midi {}
}
         