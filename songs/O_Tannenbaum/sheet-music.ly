\version "2.16.2"

\header {
  title = "O Tanenbaum"
  subtitle = "With Extra Verses"
}

melody = \relative c' {
    \key f \major
    \time 3/4 \partial 8
    c8 f8. f16 f4. g8 a8. a16 a4.
    a8 g a bes4 e, g f r8
    c8 f8. f16 f4. g8 a8. a16 a4.
    a8 g a bes4 e, g f r8
    c'8 c a d4. c8 c8. bes16 bes4.
    bes8 bes g c4. bes8 bes8. a16 a4 r8
    c,8 f8. f16 f4. g8 a8. a16 a4.
    a8 g a bes4 e, g f r8 \bar "|."
}

verse_a_also_finale = \lyricmode {
  O Tan -- nen -- baum, O Tan -- nen -- baum
  How faith -- ful -- ly you blos -- som
  O Tan -- nen -- baum, O Tan -- nen -- baum
  How faith -- ful -- ly you blos -- som
  Through sum -- mer’s heat and win -- ter's chill
  Your leaves are green and bloom -- ing still
  O Tan -- nen -- baum, O Tan -- nen -- baum
  How faith -- ful -- ly you blos -- som
}

verse_b = \lyricmode {
  O ce -- dar tree, O ce -- dar tree
  How nox -- ious is your pol -- len
  O ce -- dar tree, O ce -- dar tree
  How nox -- ious is your pol -- len
  Your pow -- der blow -- ing far and wide
  That leaves us red- and blear -- y- eyed
  O ce -- dar tree, O ce -- dar tree
  How nox -- ious is your pol -- len
}

verse_c = \lyricmode {
  O tree of worlds, O tree of worlds
  How time -- less are your branch -- es
  O tree of worlds, O tree of worlds
  How time -- less are your branch -- es
  Whose mea -- sure shines so clear and bright
  Our home in dark cha -- o -- tic night
  O tree of worlds, O tree of worlds
  How time -- less are your branch -- es
}

\score {
  <<
    \new Voice = "voice" {
      \set Staff.instrumentName = #"Voice"
      \set Staff.shortInstrumentName = #"V"
      \set Staff.midiInstrument=#"voice oohs"
      \set Staff.midiMaximumVolume=#1
      \set Staff.midiMinimumVolume=#1
      \clef "treble"
      \tempo 4=150
      \melody
    }
    \new Lyrics \lyricsto "voice" {
      <<
        \new Lyrics \verse_a_also_finale
        \new Lyrics \verse_b
        \new Lyrics \verse_c
        \new Lyrics \verse_a_also_finale
      >>
    }
  >>
    \layout { 
    \context {
      \Score
    }
  }
  \midi {}
}