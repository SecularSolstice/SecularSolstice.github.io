\version "2.18.2"

\header {
  title = "Howl"
  subtitle = "(Abbridged)"
  poet = "Allen Ginsberg"
  copyright = "CC-SA-BY"
}

words = \lyricmode {
I_saw_the_best_minds_of_my_generation_destroyed_by_madness,_starving_hysterical_naked,
dragging_themselves_through_the_streets_at_dawn_looking_for_an_angry_fix,
angelheaded_hipsters_burning_for_the_ancient_heavenly_connection_to_the_starry...
What_sphinx_of_cement_and_aluminum_bashed_open_their_skulls_and_ate_up_...
____ Mo -- loch! Solitude!_Filth!_Ugliness!_Ashcans_and_unobtainable_dollars...
____ Mo -- loch the_incomprehensible_prison!_Moloch_the_crossbone_soulless_jailhouse...
____ Mo -- loch whose_mind_is_pure_machinery! Mo -- loch whose_blood_is...
____ Mo -- loch whose_eyes_are_a_thousand_blind_windows! Mo -- loch whose_skyscrapers...
____ Mo -- loch whose_love_is_endless_oil_and_stone! Mo -- loch whose_soul_is...
____ Mo -- loch who_entered_my_soul_early! Mo -- loch in_whom_I_am...
They_broke_their_backs_lifting_Moloch_to_Heaven!_Pavements,_trees,_radios,_tons...
}

harmony = \relative c {
  \clef bass
  \hide BarLine
  \time 5/4
  <g gis>1 s4 \break
  <g a>1 s4 \break
  <g ais>1 s4 \break
  <g b>1 s4 \break
  <g c>1 dis'8 a8 <g c>1 s4 \break
  <g cis>1 e'8 ais, <g cis>1 s4 \break
  <g d'>1 f'8 b,8 <g d'>1 f'8 b,8 <g d'>1 s4 \break
  <g dis'>1 fis'8 c8 <g dis'>1 fis'8 c8 <g dis'>1 s4 \break
  <g e'>1 g'8 cis, <g e'>1 g'8 cis, <g e'>1 s4 \break
  <g f'>1 gis'8 d <g, f'>1 gis'8 d <g, f'>1 s4 \break
  <g fis'>1
}

\score {
  <<
    \new Voice = "one" {
      \set Staff.midiInstrument = #"cello"
      \set Staff.midiMinimumVolume = #0.4
      \set Staff.midiMaximumVolume = #0.6
      \set Staff.instrumentName = #"CELLO"
      \set Staff.shortInstrumentName = #"C"
      \override Staff.TimeSignature #'stencil = ##f
      \harmony
    }
    \new Lyrics \lyricsto "one" {
      \words
    }
  >>
  \layout {}
  \midi {}
}