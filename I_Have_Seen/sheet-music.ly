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


voic = \relative c' {
  \numericTimeSignature
  \time 3/4
  \repeat volta 3 {
    r2 a4 e' a, c e a, c e a, c e c
    a \break e' e a, e' e a, f' g f e
    a, c \break f a, c f a, c f f g f e
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

accomp =  \relative c{
  \chordmode {
    \repeat volta 3 {
      s2. 
      a,,:m d,:m a,,:m d,:m
      a,,:m a,,:m e,:m a,,:m
      d,:m a,,:m e,:m a,,:m
      a,,:m a,,:m e,:m a,,:m
      a,,:m
      d,:m e,:m f, e,:m
      e,:m f, g, f,
      f, g, a,:m g,
      g, a,:m a,,:1.3-.5.8 a,,:1.3-.5.8
      c,:1.3 c,:1.3
      c,:1.3 c, g,, c,
      c, g, f, c,
      c, f, g, f, g,
      c, g, f, g, c,
    }
    f, g,
    c,:1.3.5.8 g,:1.3.5.8 f, g,1.:1.3.5.8
    c,2.:1.3.5.8 g,:1.3.5.8 g, e,1.:1.4.6-
    c,2.:1.3.5.8 f,:1.3.5.8 g,:1.3.5.8 f, g,:1.3.5.8
    c, g,:1.3.5.8  f,:1.3.5.8 g, e,:1.4.6-
    g, e,:1.4.6- g,
    c, f, g, c:1.3.5.8
  }
}


vera = \lyricmode {
  Some nights I a -- wake from my bed in cold ter -- ror
  with ec -- hoes of night -- mares just roam -- ing my skin.
  All the wrongs, all the da -- ngers I hold off in day -- time
  re -- turn to my thoughts as the night clos -- es in.

  It gets so much hard -- er when mon -- sters are true.
  I can't quite i -- mag -- ine just what we could do.
  A mi -- ra -- cle's need -- ed to see us all through.
  But what have we got?  We've got me; we've got you.
  And I...
}

chorus = \lyricmode {
  I have seen the tops of clouds.
  I can breathe be -- neath the sea.
  I laugh with friends from a -- cross the world.
  Where I go a li -- bra -- ry goes with me.                
}

verb = \lyricmode {
  I see the des -- truc -- tion of earth, sky and o -- cean.
  See ig -- nor -- ant think -- ing and hate in the heart,
  Signs of fra -- il -- ty through -- out our ci -- vi -- li -- za -- tion
  It may be our ti -- cket was punched from the start.

  I'd ne -- ver say ``co -- ver your eyes from bad news.''
  But gi -- ving up now is a sure way to lose.
  So know that to hope is a thing you can choose.
  Just dig through our past: there are signs; there are clues.
  Like that...

}

verc = \lyricmode {
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

finale = \lyricmode {
  Yes I have seen the tops of clouds (tops of clouds)
  And I can breathe be -- neath the sea (the sea)
  And how I laugh with friends from ac -- ross the world
  Where I go a lib -- ra -- ry goes with me.  Goes with me.
  Goes with me!
}

#(if (ly:get-option 'chordsheet) 
     (set-global-staff-size 10))

\score {
  <<
    \new ChordNames {
      \set chordNameExceptions = #chExceptions
      \accomp
    }
    #(if (ly:get-option 'allnotations) #{
      \new FretBoards {
        \accomp
      }
    #} )
    \new Voice = "voice" {
      \clef "treble"
      \tempo 4=150
      \voic 
    }
    \new Lyrics \lyricsto "voice" {
      <<
        \new Lyrics \vera
        \new Lyrics \verb
        \new Lyrics \verc
      >>
      \new Lyrics \chorus
      \new Lyrics \finale
    }
    #(if (ly:get-option 'allnotations) #{
      \new Staff {
        \clef "treble_8"
        \accomp
      }
    #} )
  >>
  \layout { 
    \context {
      \Score
      \override ChordName #'font-size = #(if (ly:get-option 'chordsheet) 8 1)
      \override LyricText #'font-size = #(if (ly:get-option 'chordsheet) 4 1)
    }
  }
}
 
\score {
  <<
    \unfoldRepeats
    \new Voice {
      \set Staff.midiInstrument=#"acoustic guitar (nylon)"
      \set Staff.midiMaximumVolume=#0.4
      \accomp
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
