\version "2.16.2"

\header {
  title = "I Have Seen the Tops of Clouds"
  subtitle = "A Song of Morning"
  composer = "Daniel Speyer"
  copyright = "CC-SA-BY"
}

chExceptionMusic = {
  <c>1-\markup{ \super 1 }
  <c e>1-\markup{ \super 1.3 }
}
chExceptions = #( append
  ( sequential-music-to-chord-exceptions chExceptionMusic #t)
  ignatzekExceptions)

% #(if (ly:get-option 'drop)
%   #{
%     mk = g,
%   #}
%   #{
%     mk = c
%   #}
% )

mk = #(if (ly:get-option 'drop) #{ g, #} #{ c #} )
mkdecor = #(if (ly:get-option 'guitarcello)
            (if (ly:get-option 'drop) #{ g #} #{ c #} )
            (if (ly:get-option 'drop) #{ g #} #{ c' #} ))

voic = \transpose c \mk \relative c' {
  \numericTimeSignature
  \time 3/4
  \repeat volta 2 {
    r4 a2 e'4 a, c e a, c e a, c e c
    r8 a \break e'4 e a, e' e a, f' g f e
    r8 a,8 c4 \break f4 a, c f a, c f f g f e
    a, \break e' e a, e' e a, g' a g e 

    r r \break r r
    
    a, d d a e' e a, f' g f e2 
    b4 \break e e b f' f b, g' a g f2
    c4 \break f f c g' g c, a' b a g2
    d4 \break g g d a' c, e a c, e a c, e~ e2.
    r 

    r4 c e g2 e4 f2 e4 g2.
    r4 c, e g2 g4 e2 e4 c2. \break 
    r4 c( e) f2 e4 g2 e8 e f2 e4 g2.
    r4 c, e g2 a4 f2 e8 e g2 e4 c2. \break 
  }
  
  r r
  c4 e g b2 g4 a2 g4 << {b1.} {s2. a4 g b} >> \break 
  c,4 e g b2 b4 g2 g4 << { e1.} {s2. g4 e2} >> \break 
  c4 e g a2 g4 b2 g8 g a2 g4 b2. \break 
  r4 c, g' b2 c4 a2 g8 g b2 g4 e2. \break 
  b'2 g4 e2. b'2 g8 r c2.~c2.~c2.~c2.

}

decor =  \transpose c \mkdecor \relative c {
  \numericTimeSignature
  \time 3/4
  \repeat volta 2 {
    r2.
    c8 g' r2
    e8 g r2
    \tuplet 3/2 {c,8 g' e} r2
    g8 e r2
    g8 c, g' c, r4
    g'8 c, g' c, r4
    c'2.
    r
    c,4 r2
    f4 r2
    a4 r2
    f4 r2
    g8 c, g' c, r4
    g'8 c, g' c, r4
    d'2.
    r
    r
    g,4 g r
    e4 e r
    c2.
    <c g>4 r2
    c'4 c r
    a4 a r
    f2.
    <a c>4 r2
    g4 g r
    e4 e r
    c2.
    <c e>4 r2
    c8 e r2
    f8 c' r2
    f,8 c' r2
    f,8 c' r2
    a,4 c a
    c a c
    a c e
    g2 e4 f2 e4 g2. ~ g4
    c, e g2 g4 e2 e4 c2. ~ c4
    c e f2 e4 g2 e8 e f2 e4 g2.
    r4 c, e g2 a4 f2 e8 e g2 e4 c2.
  }
  g'4 e c
  g'4 e c
  c4 e g b2 g4 a2 g4 b2. a4 g b
  c,4 e g b2 b4 g2 g4 e2. g4 e2
  c4 e g a2 g4 b2 g8 g a2 g4 b2.
  r4 c, g' b2 c4 a2 g8 g b2 g4 e2.
  b'2 g4 e2. b'2 g8 r c,2. f2. g2. c2.
  
}

accomp =  \transpose c \mk \relative c{
  \chordmode {
    \repeat volta 2 {
      s2. 
      a,,:m7 d,:m a,,:m d,:m
      a,,:m7 a,,:m e,:m a,,:m7
      d,:m a,,:m e,:m a,,:m7
      a,,:m a,,:m e,:m a,,:m7
      a,,:m
      d,,:m e,,:m f,, e,,:m
      e,,:m f,, g,, f,,
      f,, g,, a,,:m7 g,,
      g,, a,,:m a,,:1.3-.5.8 a,,:1.3-.5.8
      c,:1.3 c,:1.3
      c,:1.3 c, g,, c,
      c, g, f, c,
      c, f, g, f, g,
      c, g, f, g, c,
    }
    f, g,
    c,:1.3.5.8 g,:1.3.5.8 f, g,1.:1.3.5.8
    c,2.:1.3.5.8 g,:1.3.5.8 g, a,1.:1.3-.5/e
    c,2.:1.3.5.8 f,:1.3.5.8 g,:1.3.5.8 f, g,:1.3.5.8
    c, g,:1.3.5.8  f,:1.3.5.8 g, a,:1.3-.5/e
    g, a,:1.3-.5/e g,
    c, f, g, c:1.3.5
  }
}


verse_a_chorus_and_finale = \lyricmode {
  Some nights I a -- wake from my bed in cold ter -- ror
  with ec -- hoes of night -- mares just roam -- ing my skin.
  All the wrongs, all the dang -- ers I hold off in day -- time
  re -- turn to my thoughts as the night clos -- es in.

  It gets so much hard -- er when mon -- sters are true.
  I can't quite i -- mag -- ine just what we could do.
  A mi -- ra -- cle's need -- ed to see us all through.
  But what have we got?  We've got me; we've got you.
  And I...

% }
% chorus = \lyricmode {

    I have seen the tops of clouds.
    I can breathe be -- neath the sea.
    I laugh with friends from a -- cross the world.
    Where I go a li -- bra -- ry goes with me.                

% }
% finale = \lyricmode {

  Yes I have seen the tops of clouds (tops of clouds)
  And you can breathe be -- neath the sea (the sea)
  And how we laugh with friends from ac -- ross the world
  Where I go a lib -- ra -- ry goes with me.  Goes with me.
  Goes with me! 
}


verse_b = \lyricmode {
  This is -- n't a thing that our past selves ex -- pec -- ted.
  Lord Kel -- vin as -- sured us that steel can -- not fly.
  His mis -- take was quite sub -- tle and all we need hope for
  Is si -- mil -- ar er -- rors in proofs we'll all die.

  And if we yet meet with the end that we fear,
  'Twill still have been good that this once we were here:
  For one shi -- ning mom -- ent life saw it -- self clear,
  And dreamed of how soon to the stars it might steer.
  And how...
}


\score {
  <<
    #(if (ly:get-option 'guitarcello) #{
      \new ChordNames {
        \set chordNameExceptions = #chExceptions
        \accomp
      }
    #})
    \new Voice = "voice" {
      \set Staff.instrumentName = #"Voice"
      \set Staff.shortInstrumentName = #"V"
      \clef "treble"
      \tempo 4=150
      \key \mk \major
      \voic 
    }
    \new Lyrics \lyricsto "voice" {
      <<
        \new Lyrics \verse_a_chorus_and_finale
        \new Lyrics \verse_b
      >>
    }
    \new Staff {
      #(if (ly:get-option 'guitarcello) #{
        \set Staff.instrumentName = #"Cello"
        \set Staff.shortInstrumentName = #"C"
        \clef "bass"
        #}
        #{
        \set Staff.instrumentName = #"Piano"
        \set Staff.shortInstrumentName = #"P"
        \clef "treble"
        #}
      )
      \key \mk \major
      \decor
    }
    #(if (or (ly:get-option 'allnotations) (not (ly:get-option 'guitarcello))) #{
      \new Staff {
      \set Staff.instrumentName = #"Piano"
      \set Staff.shortInstrumentName = #"P"
        \clef "bass"
        \key \mk \major
        \accomp
      }
    #} )
  >>
  \layout { 
    \context {
      \Score
    }
  }
}
 
\score {
  <<
    \unfoldRepeats
    \new Voice {
      \set Staff.midiInstrument=#"acoustic grand"
      \set Staff.midiMaximumVolume=#0.5
      \accomp
    }
    \unfoldRepeats
    \new Voice {
      #(if (ly:get-option 'guitarcello) #{
        \set Staff.midiInstrument=#"cello"
      #})
      \set Staff.midiMaximumVolume=#0.5
      \decor
    }
    \unfoldRepeats
    \new Voice = "voice" {
      \tempo 4=150
      \set Staff.midiInstrument=#"voice oohs"
      \set Staff.midiMaximumVolume=#1
      \set Staff.midiMinimumVolume=#1
      \voic 
    }
  >>    
  \midi {}
}
