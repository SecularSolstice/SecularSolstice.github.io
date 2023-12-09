\version "2.18.2"

#(set-global-staff-size 19)

\header {
  title = "A Little Echo"
  subtitle = "A Song of Night"
  composer = "Raymond Arnold"
}

words = \lyricmode {
"[V1] My" heart is beat -- ing. 
My breath is strong. 
I’m walk -- in’, runn -- in’, danc -- in’, play -- in’. 
Hav -- in’ fun. 

The wheels in -- side my mind are turn -- in’, 
Think -- in’, feel -- in’, lov -- ing’, learn -- ing. 
Won -- der -- in’ what kind of per -- son 
I’ll be -- come. 

"[Both] And" life ticks on, 
And lives con -- nect 
And ov -- er time I 
Col -- lect a lit -- tle e -- cho 
of your mind, and so, ev -- en 
when we're se -- par -- a -- ted 
Ev -- en though it's not the same 
It's sort of nice to say your name 
And hear you whis -- per mine. 

"[V2] My" heart is skipp -- in’. 
I take a ner -- vous breath. 
I fi -- nally see your face a -- gain. 
It’s been so long since last you left. 

I got a lit -- tle me -- tal cir -- cle 
Hang -- ing on my chest. 
As we col -- lide, and in -- ter -- twine, 
It pres -- ses cold a -- gainst my breast. 

"[Both] And" life ticks on, 
And lives con -- nect 
And ov -- er time I 
Col -- lect a lit -- tle e -- cho 
of your mind, 
and so, ev -- en when we're se -- par -- a -- ted 
Ev -- en though it's not the same 
It's sort of nice to say your name 
And hear you whis -- per mine. 

"[V1] My" heart is fail -- in’ 
My breath is slow. 
I’m look -- in’, long -- in’, lov -- in’, wish -- in’ 
That I did -- n’t have to go. 

I've got a lit -- tle me -- tal cir -- cle
Ly -- ing on my chest
It's got some lit -- tle words in -- scribed
To guide me to my rest

And dare I hope, in flesh or spi -- rit,
Some -- where, some -- day I'll a -- wake?
Though I can't guess how things might change
I just don't know what world you would make
While I was gone
I just don’t know. 
I just don’t know how long. 

"[V2] And" life ticks on, 
And lives con -- nect 
And ov -- er time I 
Col -- lect a lit -- tle e -- cho 
of your mind, 
and so, ev -- en when we're se -- par -- a -- ted 
Ev -- en though it's not the same 
It's sort of nice to say your name 
And hear you whis -- per mine.   
}

vocal = \relative c' {
  r1 r2 r4 r8 r16 a e'8 e d16 c8.
  r4 r8 r16 c d a8. c4 r4 r8 r16
  a d8 d d16 e8. f8 e d16 c8.
  d8 a16 c8. r8 r4 r8 r16 
  a e'8 e d c16 d~ d8 e d16 e8.
  a8 e d16 e8. a8  e d16 e8.
  f8 f16 f r8 r16 c d8 e16 d~ d8 c
  e a,16 c~ c8 r8 r4 r8
  c f4 a a r8 e c'4 g8 a r4 r8 r16
  a16 bes8 c4 bes4. a8. g16
  a8. g16 f g8. a16 g8. f8 c
  e4 d c a8 c
  d d d c16 d~ d8 c a c
  e fes e c16 c~ c8 r16 a a8 c
  d ees d c16 c~ c4 r
  r4 r8 c c g a c c4 r4 r2
  r2 r4 r8 r16 g
  e'8 e d16 c8. r4 r8 r16 c
  d8 g,16 a c8 a r4 r8 r16 g
  d'8 d d16 e8. f8 e16 c~ c8 r16 d
  f8 e c16 d8. f8 e c r16 g
  e'8 e d16 c8. d16 e8. d16 e8.
  a e16 d8 e f r4 r16 e
  f8[ e16 c16~ c8] c f[ e16 c~ c8] r16 c
  f8 e c r16 f f8[ e c] c
  f4 a a r8 e c'4 g8 a r4 r8 r16
  a16 bes8 c4 bes4. a8. g16
  a8. g16 f g8. a16 g8. f8 c
  e4 d c a8 c
  d d d c16 d~ d8 c a c
  e fes e c16 c~ c8 r16 a a8 c
  d ees d c16 c~ c4 r
  r4 r8 c c g a c c4 r4 r2
  r2 r4 r8 r16 g
  e'8 e d16 c8. r4 r8 r16 c
  d16 g,8. c4 r4 r8 r16 g
  d'8 d d16 e8. f16 e8. d16 c8.
  d8 c g16 c8. e8 c16 a~ a8 r16 g
  e'8 e d16 c8. d16 e8. d16 e8.
  a8 e16 d8 e8. e8 r4 r16 a,
  f'8 e c16 g8. f'8 e16 c~ c8 r16 g
  f'8 e c16 a~ a g~ g8 r8 r e'
  f e f8. e16 f8 e16 f~ f e8.
  c'8 a a e g a a r16 f
  bes8 a f d16 bes'8 a f8. r16 g
  a8 g f a a g f~ f c4
  r4 r8 c16 e~ e8 c
  d4 r r8 e d c e4 r r8 e16 d~ d8 c
  e4 c a r
  r2 r4 r8  c f4 a a r8 e c'4 g8 a r4 r8 r16
  a16 bes8 c4 bes4. a8. g16
  a8. g16 f g8. a16 g8. f8 c
  e4 d c a8 c
  d d d c16 d~ d8 c a c
  e fes e c16 c~ c8 r16 a a8 c
  d ees d c16 c~ c4 r
  r4 r8 c c g a c c4 r4 r2
}

rp = \relative c'' {
  \repeat unfold 79 {c4} c8 d
  <<
    {
      \repeat unfold 76 {c4}
    }
    {
      e g c g
      c2 c4 g
      s2 f8 e16 d s4
      c'2 f,8 e16 d s e8.
      f2 a
      c c4 g
      a2 c4 g
      bes2 f8 e16 d s e8.
      f4 a c a
      c2 c4 a
      c2 e4 c
      s2 bes2
      s2 a4 f
      c'2 c4 g
      fis2 fis4 d
      f2 s
      s1 s s
    }
  >>
  c1
  \repeat unfold 27 {r1}
}

lp = \relative c {
  \chordmode {
    r1 r c,
    a,,:m g,, 
    f,, c,
    a,,:m bes,,/f
    f,, f,/c c,:1.3.6
    d,:1.3-.6- f,/c c,:1.3.5.8
    d,:1.3.7 bes,/f
    f, r c,
    c, c, a,,:m
    g,, f,,
    c, a,,:m
    f,,:1.4.6 f,,
    f,/c c,:1.3.6
    d,:1.3-.6- f,/c c,:1.3.5.8
    d,:1.3.7 bes,/f
    f, r c,
    c,:1
    c, a,,:m
    g,, f,, c, a,,:m
    bes,,/f f,,
    f,,/c c,:1.3.6
    d,:1.3-.6-
    f,,/c c,:1.3.5.8
    d,:1.3.7
    bes,/f f,
    r f,,/c c,:1.3.6
        d,:1.3-.6- f,/c c,:1.3.5.8
    d,:1.3.7 bes,/f
    f, r c,
  }
}

\score {
  <<
    \new Voice = "one" {
      \tempo 4 = 65
      \set Staff.midiInstrument = #"voice oohs"
      \set Staff.midiMinimumVolume = #0.8
      \set Staff.midiMaximumVolume = #1
      \set Staff.instrumentName = #"VOICE"
      \set Staff.shortInstrumentName = #"V"
      \vocal
    }
    \new Lyrics \lyricsto "one" {
      \words
    }
    \new PianoStaff <<
      \set PianoStaff.instrumentName = #"PIANO"
      \set PianoStaff.shortInstrumentName = #"P"
      \new Voice {
          \set Staff.midiMinimumVolume = #0.6
          \set Staff.midiMaximumVolume = #0.8
          \rp
        
      }
      \new Voice {
          \set Staff.midiMinimumVolume = #0.4
          \set Staff.midiMaximumVolume = #0.6
          \clef bass
          \lp
        
      }
    >>
  >>
  \layout {}
  \midi {}
}