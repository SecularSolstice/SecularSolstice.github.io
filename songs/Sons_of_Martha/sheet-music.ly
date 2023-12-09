\version "2.18.1"

#(set-global-staff-size 19)

\header {
  title = "Sons of Martha"
  subtitle = "A Song of Dusk"
  composer = "Daniel Speyer"
  poet = "Rudyard Kipling"
  copyright = "CC-SA-BY"
}

mk = #(case (ly:get-option 'key)
       ((a) #{a,#})
       ((b) #{b,#})
       ((c) #{c#})
       ((d) #{d,#})
       ((e) #{e,#})
       ((f) #{f,#})
       ((g) #{g,#})
       (else #{c#}))

words = \lyricmode {
  The Sons of Ma -- ry sel -- dom bo -- ther, 
  for they have in -- her -- it -- ed that good part;
  But the Sons of Mar -- tha fa -- vour their Mo -- ther 
  of the care -- ful soul and the troubl -- ed heart.
  And be -- cause she lost her tem -- per once, and 
  be -- cause she was rude to the Lord her Guest,
  Her Sons must wait up -- on Ma -- ry’s Sons, 
  world with -- out end, re -- prieve, or rest.

  It is their care in all the ag -- es 
  to take the buf -- fet and cush -- ion the shock.
  It is their care that the gear en -- ga -- ges;
  it is their care that the switch -- es lock.
  It is their care that the wheels run tru -- ly;
  it is their care to em -- bark and en -- train,
  Tal -- ly, trans -- port, and de -- li -- ver du -- ly 
  the Sons of Ma -- ry by land and main.

  They say to moun -- tains, ”Be ye re -- moved”
  They say to the les -- ser floods ”Be dry.”
  Un -- der their rods are the rocks re -- proved; 
  they are not a -- fraid of that which is high.
  Then do the hill tops shake to the sum -- mit;
  then is the bed of the deep laid bare,
  That the Sons of Ma -- ry may ov -- er -- come it,
  plea -- sant -- ly sleep -- ing and un -- a -- ware.

  They do not preach that their God will rouse them
  a lit -- tle be -- fore the nuts work loose.
  They do not teach that His Pi -- ty al -- lows them 
  to leave their job when they damn well choose.
  As in the thronged and the light -- ed ways, 
  so in the dark and the des -- ert they stand,
  Wa -- ry and watch -- ful all their days 
  that their breth -- ren’s days may be long in the land.

  To these from birth is Be -- lief for -- bid -- den;
  from these till death is Re -- lief a -- far.
  They are con -- cerned with mat -- ters hid -- den; 
  un -- der the earth -- line their al -- tars are
  The sec -- ret foun -- tains to fol -- low up, 
  wa -- ters with -- drawn to re -- store to the mouth,
  And ga -- ther the floods as in a cup,
  and pour them a -- gain at a ci -- ty’s drouth.

  And the Sons of Ma -- ry smile and are blessed;
  they know the ang -- els are on their side.
  They know in them is the Grace con -- fessed,
  and for them are the Mer -- cies mul -- ti -- plied.
  They sit at the Feet; they hear the Word; 
  they see how tru -- ly the Pro -- mise runs.
  They have cast their bur -- den up -- on the Lord, 
  and the Lord He lays it on Marth -- a’s Sons!
}

melody =  \transpose c \mk \relative c'{
  \numericTimeSignature
  \time 2/4
  \tempo 4=100
  \key c \major
  s2 s s s s s
  s4.

  d8 g4. e8 a4. g8 b4 a g e
  r4. d8 e d4 e8 g4 e8 g8 b a4. g4 r
  r c,8 c f4 d g f a4 a8 g e4 c
  r e8 e c4 c c f8 f c8 c4. c4. s8
  s2 s4 d8 d f4. d8 g4 e4 bes'8 f r4 d4 
  c8 c e4 d8 d g4. e16 e b'4. a8 f4
  r8 c e4. c8 g' e d4  a'8 e4. c4. r8
  c4 c8 c c4. c8 c4. c8 c2
  
  s2 s s \tempo 4=110 s s s s
  
  
  r4. g'8 f4 e d4. a'8 g4 e d8 d4.
  r4. g8 e4 d c8 c r a' f8 e8 d4 c4
  r8 g'8 f4 e d a'8 a g4 e d8 d4.
  r4. g8 e4 d c a'8 a8 f4. d8 c2 s
  r4. c8 e4. g8 a4 g8 f8 f4 a d,8 d
  r8 c8 e4. g8 a4 f8 e8 e8 g g4 c,4 r
  c4. c8 e8 e8 f8 f g4 r8 f8 g4 f8
  g a4. g8 a4 g8 f f4. d8 c2
  s s
  
  r4. c8 e4 f d b8 b c4. b8 c4
  r8 c e4 g8 g f4 e c4. b8 c4
  r8 c e4 a g f8 e c4. b8 c4
  c8 c e4 d f g a8 a g4 a2 
  s s 
  c,4 e8 f g4. f8 g4 f8 f e f4.
  f4 e8 d c4 e8 d c4. b8 c8 r
  d8 d e4. g8 a4 g a a8 g e4 d8 r
  a'4 g8 e g4 e8 d g4 f c2
  
  s2 s
  \tempo 4=120
  s2 s s
  r4. g'8 f4 e d4 a'8 a f4 e d8 d4.
  r4. g8 e4 d8 c8 c4 r8 a' f4 e8( d)  c4
  r8 g'8 f4 e d a'8 a g8 g8 e4 d8 d4.
  r4. g8 e4 d c a'8 a8 f4. d8 c2 s
  s4 r8 c8 e4. g8 a4 g8 f8 f4 a d,4
  r8 c8 e4. g8 a4 f8 f8 e8 g g4 c,4 r
  c4 c8 c e4 e f f g8 r f8 g8 f4
  g a4 g8 a8 g4 f8 d8 c2
  s s

  
  r4. c8 e4 f d b8 b c4. b8 c c
  r8 c e4 g g f8 e c4. b8 c4
  r8 c e4 a g f4 c4. b8 c8 c8 r4
  c4 c8 e8 d4 f8 g8 a4 g4 a4 r4 
  s2 s s4.
  c,8 e4 f g4 f8 g8 f4. e8 f4. r8
  f4 e8 d c4 e8 d c4 b8 b c4 r8
  d8 d e4 g8 a4 g a e4 d r8
  a' g8 e g4 e4 d8 d g4. f8 c2
  
  \tempo 4=100
  s2 s
  r4 d8 d e4. d8 g4 a b4 a8 g e4
  r8 d d4. e8 g g4 g8 a4 g a
  r8 d, e4 d g a8 g b4. a8 g8 r
  d8 d e4 d8 d g4. d8 a'4 g e
  r8 a g4 e8 e d4
  r8 a' g4 e d4
  r8 a'8 g4. e8 g4 g8 a g4 e d8 r
  d8 d e4. d8 g4 d8 g g4. a8 b2
  s s s s s
  r4 g8 a b2
  \tempo 4=130
  b2 b4 a8 f8 g4 b,4 c4 r
  s2
  
  
  
  
}

decoration =  \transpose c \mk \relative c' {
  \numericTimeSignature
  \time 2/4
  \key c \major
  r4 e8 f
  r4 f8 e
  r4 e16 d e8
  r4 f16 e16 f8
  r4 d16 e g8
  r4 f16 e c8
  d4. s8
  s2 s s s s s s s s s s s s s s s s s
  s f4 d8 d d4 s
  s2 s s s s s s s s s s s s s s s 
  g8 e d4 r g8 d d'8 b a4 r d8 a c,8 a8 g4 r4 c8 g f'8 d c4
  s2 s s s s s s s s s s s s s s s s s s
  r4 f8 c
  s2 s s s s s s s s s s s s s s s s
  a'8 b d4 f,8 g b4
  s2 s s s s s s s s s s s s s s s s
  c8 b c4 c,8 b c4
  s2 s s s s s s s s s s s s s s s 
  r8 f g f r8 b c b r4 f'8 r c8 b8 g4 f8 e8 c4
  s2 s s s s s s s s s s s s s s s s s s
  d'4 c,4
  s2 s s s s s s s s s s s s s s s s
  f8 e f4 d8 c d4 s2 s
  s2 s s s s s s s s s s s s s s
  r4 e8 e f4. e8 f8 f8 r4 s2
  s2 s s s s s s s s s s s s s s 
  r4 r8 d8  g  b a e 
  s2 s 
  s2 s s s s s s s s s s s s s s s s s s s s s s s s s s 
  g8 g4 a8 b2 g8 g4 a8 b2 c
  s s s s s s 
  <<c4 e g >> r
}

harmony = \transpose c \mk {
  \numericTimeSignature
  \time 2/4
  \clef bass
  \key c \major
  \chordmode {
    c,2 g,,  c,  f,,  g,,  c,
    d,:m
  }
  
  <<e g>> <<e a>> <<b4 d'4>> <<c4 a4>> <<d g>> <<c e>>
  <<d a>> <<d f>> <<e2 a2>> <<g e>> <<g8 b>> <<e4. a>> <<d2 g>>
  \chordmode {
    c,2 d,:m g,, a,,:m c, e,:1.4.6- c,4 c, c,2 b,,8:1.3-.5- g,,4. c,2
    a,,4:1.3-.6- c,8:1.4.7+ c,:1.4.7+ d,2:m
    d,:m e,:m bes,, d,:m
    e,:m g, f, c, c, c,/g a,,:m c,
    a,,4:m a,,8:m a,,:m d,2:m g,,4. g,,8:1.3.5.8 c,2
    
    g,,:1.5 g,, d,:1.5 d,:m c,,:1.5 c,, c,
    g,, f,, d,:m e,,:m d,:m
    g,, d,:m c,4. r8 d,,2:m c,4.
    r8 f,,2 d,:m e,,:m d,:m
    g,, d,:m c,4. r8 d,,2:m c,2
    f,,
    c, c, a,,:m f, d,4.:m r8
    c,2 f,, e,,:m c,
    c,/g  e,:m g,, b,,:1.3-.6-
    a,,:1.5 a,,:1.3- f,, c,

    d,,:m b,,:1.3-.5-
    c, e,,:m b,,:1.3-.5- c,,
    c, e,,:m b,,:1.3-.5- c,,
    c, a,,:m g,, e,,:1.4.6-
    c, e,:m g, c,:1.3.6 a,:m 
    b,:1.3-.5- c,
    c,4 a,,:1.4.6-.8 g,,4. f,,8:1.3.5.8 g,,2 f,,
    f,, c, e,,:1.4.6- c,4 r
    e,2:1.3- a,:1.3- a,,:1.5 d,:1.5
    a,:1.3- e,:1.3- g,,4 f,, c,2/e

    g,, c, g,, g,, c,
    g,, f,, d,:m b,,:1.4.6- d,:m
    g,, d,:m c,4. r8 d,2:m c,4.
    r8 f,,2 d,:m e,,:m d,:m
    g,, d,:m c,4. r8 d,,4.:m d,,8:m c,2
    d,:m  c,:1.4.6
    c, a,,:m f, d,4.:m r8
    c,2 f,, e,,:m c,
    c,/g  e,:m g,, b,,:1.3-.6-
    a,,:1.5 a,,:1.3- f,,4 r c,2
    
    f,, b,,:1.3-.5-
    c, e,:m b,,:1.3-.5- c,,
    c, e,:m g,,:1.3.6 c,,
    c, a,,:m g,, e,,:1.4.6-
    c, e,:m/b g, c,:1.3.6 a,:m 
    e,:m f,, f,4. r8
    c,4 a,,:1.3-.6-.8 g,,4:1.3.5.8 g,,:7 g,,2 f,,
    f,, c, e,,:1.3-.6- c,4 r
    e,2:m c,,:1.3.6 a,,:m d,:m
    a,,:m e,:m g,,4. f,,8 c,2/e
    
    
    c,/g e,:m
  }
  <<d a>> <<e g>> <<a e>> <<b d>> <<e b>>
  <<d a>> <<g b,>> <<a e>>
  <<d a>> <<e g>> <<a e>> <<a e>> <<d g>> <<e g,>> <<g b>> <<a e>>
  <<a, e>> <<e g>> <<d a>> <<e g>> <<d a>> <<e g>> <<g, d>> <<g b>>
  <<d a>> <<e g>> <<g, d>> <<g b>> <<f c'>>
  <<g g,>> <<f a,>> <<g g,>> <<f a,>> 
  \chordmode {
    a,:m/e g, f, f, f, g,,4 r c, r c,,  r
  }
}

\score {
  <<
    \new Staff
    \with {
      midiInstrument = #"voice oohs"
      midiMinimumVolume = #0.8
      midiMaximumVolume = #1
      \override VerticalAxisGroup.staff-staff-spacing =
      #(if (not (or (ly:get-option 'threestaff) (ly:get-option 'justvoice)))
        '((basic-distance . 0)
          (minimum-distance . 0)
          (padding . -200))
        '())
      instrumentName = #(if (or (ly:get-option 'threestaff) (ly:get-option 'justvoice)) "Voice")
    }
    \new Voice = "melody" \melody

    #(if (not (ly:get-option 'justvoice)) #{
    \new Staff
    \with {
      midiInstrument = #"acoustic grand"
      midiMinimumVolume = #0.4
      midiMaximumVolume = #0.5
      instrumentName = #(if (ly:get-option 'threestaff)
                         "Piano" "Voice & Piano")
      shortInstrumentName = #"V&P"
      \override VerticalAxisGroup.staff-staff-spacing =
      #'((basic-distance . 0)
         (minimum-distance . 0)
         (padding . -200))
    }
      <<
        \melody
        \decoration
      >>
    #} )
    
    \new Lyrics \lyricsto "melody" {
      \words
    }
    
    #(if (not (ly:get-option 'justvoice)) #{
    \new Voice {
      \set Staff.midiInstrument = #"acoustic grand"
      \set Staff.midiMinimumVolume = #0.3
      \set Staff.midiMaximumVolume = #0.5
      \set Staff.instrumentName = #"Piano"
      \set Staff.shortInstrumentName = #"P"
      \harmony
      
    }
    #} )
%    \new DrumStaff {
%      \set DrumStaff.midiMinimumVolume = #0.3
%      \set DrumStaff.midiMaximumVolume = #0.3
%      \drummode {
%        \repeat unfold 245 {
%          hh8 hh hh hhc
%        } cymc4
%      }
%    }
  >>

  \layout {}
  
  \midi {}
}
