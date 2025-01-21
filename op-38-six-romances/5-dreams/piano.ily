\version "2.24.4"
\language "english"

#(define ((shift offsets) grob)
 (let ((note-heads (ly:grob-array->list (ly:grob-object grob 'note-heads))))
   (for-each
     (lambda (p q) (ly:grob-translate-axis! p (* q 1.251178) X))
     note-heads offsets)))

displaceHeads =
#(define-music-function (parser location offsets) (list?)
 #{
   \once \override NoteColumn #'before-line-breaking = #(shift offsets)
 #}
)


dynamics = {
  \partial 8 s8\mf
  s2.*6
  s2.\p
  s2.*13
  s4.\mf s8 s4-\markup { \italic "dim." }
  s8 s8-\markup { \italic "marcato il melodia" } s2
  s8*9*6
  \barNumberCheck #29
  s8 s8 s8 s8 s8 s8
  s8 s8 s8 s8 s8 s8
  s8 s8 s8 s8 s8 s8 s8 s8 s8
  s8 s8 s8 s8 s8 s8
  s8 s8 s8 s8 s8 s8
  s8 s8 s8 s8 s8 s8 s8 s8 s8
  s8 s8 s8
  s8 s8 s8
  s8 s8 s8
  s2.-\markup { \italic "calando" }
  s8 s4 
    \once\override DynamicText.Y-offset = #-5
    s4.\pp
}

upper = \relative a'' {
  \set subdivideBeams = ##t
  \key df \major
  \time 3/4
  \tempo "Lento"
  \partial 8 bf8( |
    af8 bf f bf df,4 ~ |
    df8) bf'( df,[ af' bf, bf'] |
    af,4.) bf'8( af[ bf] |
    f8 bf bf,4.) bf'8( |
    af,4 ~ \tuplet 3/2 4 { af8) bf'( af bf f bf ~ |
    bf) bf( f bf df, bf' bf,4) bf'8( } |
    af,4) af'--( bf, ~ |
    bf8) r8 af'4--( bf, ~ |
    bf8) r8 af'4--( bf, ~ |
    bf8) r8 af'4--( \once \tieDashed bf, ~ |
  \barNumberCheck #11
  \set suggestAccidentals = ##t
  \override Staff.AccidentalSuggestion.parenthesized = ##t
    bf8^\markup { \smaller \parenthesize \natural})
  \set suggestAccidentals = ##f 
      r8 \tuplet 3/2 4 { gs'4  gs8-- gs--( b gs)  |
    gs4-- gs8 gs--( b gs) } gs4-- ~ |
    gs8 r8 af4--( bf,8 af' |
    bf,4) \tuplet 3/2 4 { af'4--( bf,8 af'[ bf, af'] } |
    bf,4) af'16--( bf,) r8 r af'16--( bf,) |
    r4 af'16--( bf,) r8 r 
    \shape #'(((0 . 0)(0 . .5)(2.75 . .5)(2.75 . 0)) ((0 . 0)(0 . 0.5)(0 . 1)(0 . 0))) Slur
      af'16( af, |
    af'16 bf,) r8 bf'16( af, af'[ bf,]) r8 r |
  \voiceOne
  \set baseMoment = #(ly:make-moment 1/8)
    r8. bf16[( \set stemLeftBeamCount = #1 bf' af,] af'[ bf,]) r8 bf'16( af, ~ |
  \set baseMoment = #(ly:make-moment 3/8)
    af16[ af' ef bf' f df] bf[ af' ef bf' f df]) |
  \omit TupletBracket
  \set baseMoment = #(ly:make-moment 1/8)
  
    \tuplet 3/2 8 { af[( af' ef bf' f df bf af' ef] bf'[ f df) } af32( af' ef bf' f df bf af'] |
    ef32[ bf' f df af af' ef bf' f df bf af'] ef bf' f df \tuplet 6/4 8 { af32 af' ef bf' f df bf af' ef bf' f df }
    \tuplet 6/4 8 { af32[ af' ef bf' f df }  \tempo "rit." bf32 af' ef bf' f df af af'] ef[ bf' f df bf8)] r16 af^\markup{ \italic "legato"} |
  \set baseMoment = #(ly:make-moment 9/4)
  \time 9/8
  \tempo "Meno mosso"
  \set subdivideBeams = ##f
  \set baseMoment = #(ly:make-moment 1/8)
  
  \override Staff.TimeSignature.stencil = #(lambda (grob) (parenthesize-stencil (ly:time-signature::print grob) 0.1 0.4 0.4 0.1 ))
    df16 af' ef bf' f bf, df af' ef bf' f bf, df af' ef bf' f bf, |
    df16( af' ef bf' f bf,) df( af' ef bf' f bf,) df( af' ef bf' f bf,) |
  \oneVoice
    d( <af' f,> ef <bf'  gf,> f <af,>) ef'( c' f, af, a gf' ~ gf) e'( af, b, c a') |
  
  \omit TupletBracket
  
  \set subdivideBeams = ##t
  \set baseMoment = #(ly:make-moment 1/8)
  \tuplet 3/2 8 { 
    \shape #'((0 . -2)(0 . 1)(2.5 . 2.5)(0 . -3)) Slur
      a16( df f, bf f' f, c' a' f,) } \ottava #1 
    \shape #'((0 . -2)(0 . 1)(2 . 2)(0 . -2)) Slur
    df'32( ef f bf, ef f a c, f c' df df,) \ottava #0 \set subdivideBeams = ##f r16 <df, ef> <c f> <bf gf'> <af af'> <gf bf'> |
  <f, bf df>4( <c' ef>8) 
  \voiceOne 
    <df f>8 gf8 af8 bf8 cf8 bf |
  r16
  \shape #'((0 . 0)(0 . 0)(1.5 . 2)(1.5 . -3)) Slur
    bf'16( af16 bf16 f16 bf16 
  \voiceTwo
    \hideNotes af,8) \unHideNotes \voiceTwo ef16[ bf f' bf,] r16 bf8. ~ bf16 bf
  \voiceOne
  \time 3/4
  r16 bf''[ \tuplet 3/2 8 { \set stemLeftBeamCount = #1 af bf \set stemRightBeamCount = #1 af \set stemLeftBeamCount = #1 bf ef, bf'] } s4. |
  s4. r16 <af bf>[ <gf c> <f df'> <ef ef'> <df f'>]
  \time 9/8
  s8 s4 s4. r16 <df ef> <c f> <bf gf'> <af af'> <gf bf'> |
  \pageBreak
  \time 3/4
  \oneVoice
  r16 bf'[( af bf\< f bf\!] df,[ bf' bf,\> bf' af, bf'\!] |
  ff,16) bf'( af bf gf bf ef, bf' af, bf' gf, bf' |
  \time 9/8
  \set subdivideBeams = ##t
  \set baseMoment = #(ly:make-moment 3/8)
  d,,16\noBeam) gs' \tuplet 3/2 8 { fs gs e gs cs, gs' } gs,\noBeam cs'( \tuplet 3/2 8 { b cs gs cs ef, cs'} c,32\noBeam) ds'( cs \set stemRightBeamCount = #1 e \set stemLeftBeamCount = #1 b fs' a, \set stemRightBeamCount = #1 gs' \set stemLeftBeamCount = #1  gs, a' fs, b')
  \time 3/8|
  \set baseMoment = #(ly:make-moment 1/8)
  \set Timing.beamExceptions = \beamExceptions { 8[] 8[] 8[]}
  \tuplet 3/2 8 { <af, df f af>16[( <bf ef bf'> <af f' af>] <bf ef bf'>[ <af f' af> <bf ef bf'>] <af f' af>[ <gf df' gf> <f bf f'>]) |
  <f df' f>[( <ef bf' ef> <f df' f>] <ef af ef'>[ <f df' f> <ef bf' ef>] <df af' df>[ <bf f' bf> <af ef' af>]) |
  <bf f' bf>[( <af ef' af> <bf f' bf>] <af ef' af>[ <bf f' bf> <af ef' af>] <af ef' af>[ <gf df' gf> <af ef' af>] |
  }
  \time 3/4
  <df f>8) <f df' f>--( <df gf df'>--) \once\teeny r8 <f, df' f>--( <gf df'>--)
  \tempo "rit." 
  \voiceOne
  \shape #'((0 . -1)(0 . 1)(0 . 1)(0 . 0)) Slur
  f8( \clef bass \once \override Stem.length = #2.5 df4-- ~ df4.\fermata)
  \fine
}

upperTwo = \relative a' {
  \key df \major
  \time 3/4
  \tempo "Lento"
    \partial 8 s8
    s2.*17
  \voiceTwo
  \autoBeamOff
    ff,2.--
    s4. bf'4 s8
    af4 bf4 af8 s32*2 bf8*1/2
    s8 af8 s16 bf8 s16 af8 bf
    af8 bf s16 af8 s16 bf8 s8
  \time 9/8
    r16 f8 af bf f af bf gf f ef16
    r16 f8 af bf f af bf f af bf16
    
}

lowerOne = \relative c' {
  \key df \major
  \time 3/4
  \tempo "Lento"
    \partial 8 r8 |
    R2.
    R2.
  \voiceOne
    bf4( df4 f4) |
    \shape #'((0.5 . -3)(0.5 . -3)(-0.5 . -2)(-0.5 . -2)) Slur af2--( df4) |
    bf,4( df4 f4) |
    af2( df4) |
    gf,8( df'4 df,8 f8 df'8) |
    gf,8( df'4 df,8 f8 df'8) |
  \once \override NoteColumn.force-hshift = #0.75
    f,8( c'4 c,8 e8 c'8) |
  \once \override NoteColumn.force-hshift = #-1
    f,8( c'4 c,8 e8 c'8) |
    e,8( b'4 b,8 ds8 b'8) |
    e,8( b'8 fs8 b,8 ds8 b'8) |
    ef,8( ~ <ef bf'>4 bf8 d8 f8) |
    df8( ~ <df bf'>4 bf8 c8 e8) |
    cf8([ bf'8 ff8 cf8] bf'8 ff8 |
    cf8)[ bf'8( ef,8 cf8] bf'8 ef,8 |
    bf8)[ af'8( d,8] bf8)[ af'8( d,8] |
    bf8)[ af'8( d,8] bf8[ af'8 d,8)] |
    r8 f8[ df8] af8[ af'8 df,8] |
    bf8[ f'8 df8] af8[ af'8 df,8] |
    bf8[ f'8 df8] af8[ af'8 df,8] |
    bf8\noBeam af8[( bf8] df8\arpeggio ef8-- <f af,>8--) |
  \time 9/8
  \tempo "Meno mosso"
  \override Staff.TimeSignature.stencil = #(lambda (grob) (parenthesize-stencil (ly:time-signature::print grob) 0.1 0.4 0.4 0.1 ))
    af,4.-- ~ af8 bf8-- af8--  bf8-- c8-- df8-- |
    f,4.*2/3-- s16 \hideNotes \once\stemDown f ~ \unHideNotes f8 ef8-- df8-- af'4-- bf8-- |
    cf4.-- c8( df8-- ef8--) e4-- f8-- |
    f8 gf8 a8 bf8\arpeggio c8 df8 
  \clef bass
      <gf,, bf df ef>4. |
  \change Staff = "Up"
  \voiceTwo
    s4 s8 r8 ef'16 df16 f16 c16  gf'16 cf,16 af'16 cf,16 gf'16 cf,16 |
    <bf f' af>4.-- ~ 
  \voiceOne
      <bf f' af>8 gf'8( af8) <f af>4^\>( <ef gf>8\!) |
  \voiceTwo
    <af, ef' gf>4. ~ 
  \oneVoice
      <af ef' gf>8  df8[( ef8] |
    f8 ef8 df8) ~ <gf, bf df ef>4.*1/6 
  \voiceTwo
      c'16[ bf gf ef bf] |
  \oneVoice
    <f' af df f af>8\arpeggio df8([ ef8] f8 ef8 df8) ~ <gf, bf df ef>4.*1/6--
  \voiceTwo
      af'16 gf ef bf gf|
  \change Staff = "Down"
  \voiceOne
  \clef bass
    <f df'>8 ef'8 f8-- ~ <f af>4--( bf8) |
    af,8-- cf8-- ef8-- ~ <ef gf>4--( af8) |
    fs,8-- a8-- cs8-- e4--( gs8--) a8-- 
  \clef treble
      b8-- <fs cs'>8-- |
  \clef bass
    <df f, af, df,>4--\arpeggio s8 |
    <df af>4-- s8 |
    <df f,>4-- \tuplet 3/2 { bf8--( ff'16--) } |
    \tuplet 3/2 { df16-- ef16 df16 } 
  \clef treble
      <ef a>8--[( <eff af>8--])
  \clef bass
      <f, af>8 \clef treble <ef' a>8--[( <eff af>8--]) |
  \change Staff = "Up"
  \voiceTwo
    df8\noBeam bff8( gf8 f4.) |
  \fine
}

lowerTwo = \relative e, {
  \set subdivideBeams = ##t
  \voiceTwo
    \partial 8 s8 |
    s2.*2
    <ef bf' f'>2. |
    r8 \clef treble df''4( bf8 <ef gf>4) |
  \clef bass
    <ef,, bf' f'>2. 
    r8 
  \clef treble
      df''4( bf8 <ef gf>4) |
    <af, df>2. |
    <af df>2. |
  \voiceFour
  \once \override Dots.extra-offset = #'(-2.5 . 0)
    <af ff'>2. |
    << { \voiceFour 
         \once \override Dots.extra-offset = #'(-1.25 . 0)
         af2. 
       }
       \\ 
       { \voiceThree  
         \once \override NoteColumn.force-hshift = #0.2 
         f'2 
       }
    >> |
  \voiceTwo
    <gs, b>2. |
    <gs b>2. |
    <af bf>2. |
    <af bf>2. |
    af2. |
    af2. |
  \clef bass
    af2. |
    af2. |
    <ef, bf' f'>2. |
    <ef bf' f'>2.\arpeggio |
    <af, af' ef' gf>2.\arpeggio |
  \set tieWaitForNote = ##t
    <af af' ef' gf>4.\arpeggio <af' ef'>16\arpeggio[ gf'16 ~ ef'16 bf16 ~ <gf bf>8] |
  \tempo "Meno mosso"
  \time 9/8
  \set tieWaitForNote = ##f
  \set baseMoment = #(ly:make-moment 1/4)
    <df, af' f'>8\arpeggio df,16( df'16 af'16 f'16) r16 af,16 bf'16 f16 af16 \shape #'((-0.5 . -0.25)(-0.5 . -0.25)(0 . -0.25)(0 . -0.25)) Tie af,16  ~ <af ef'>16 gf'16 c16 f16 df16 gf,16 |
    <df, af'>8 df,16( df'16 af'16 f'16) r16 af16( ef16 af,16 df16 df,16 
  \set subdivideBeams = ##f
  \set tieWaitForNote = ##t
      <af' f'>8) <df, df,>16( af'16 ~ bf'16 df,16 ~ |
    <af df f>8) df,16( af'16 f'16 ~ cf'16) <f, a>4. <fs a c>8 df,16( af''16 a16 c16) |
    <a df>16 df,16 
  \clef treble
      <bf' ef>16 \once \tieUp df16 ~ <c df>16 f16 ~ <f df g,>16\arpeggio[( 
  \clef bass
      <g, bf, ef,>16] 
  \clef treble
      df'16 f16 g16 bf16) \clef bass  r8 af,,,16( gf''16 df'16 c16) |
  \oneVoice
    r16
    \shape #'((0 . -8)(0 . 2)(0 . 2)(0 . -3)) Slur
      bf,,16( bf'16 f'16 bf16 bf'16 ~ bf16 bf,16 ~ bf8) 
      <<
        { \voiceOne
          ef,8--\noBeam ~ ef4.|
          r16 bf16( f'16 bf16 f'16 af16 bf16[ bf,16]) r8
        }
        \\
        { \voiceTwo 
          s8 af,,16[ af'8 ef'16 ef'8] |
          <ef,, ef,>4.
        }
      >>    
      <<
        { \voiceOne
          df'8-- ~ df4.
        }
        \\
        { \voiceTwo
          s8 gf,,16[ gf' df' c' df8]
        }
      >>|
  \time 6/8
    << {
         r16 af,16([ ef'16 af16 ef'16 gf16] af16[ af,16])
       }
       \\
       {
         <df,, df,>4.
       }
    >>
      r16 <f' af, df,>8\arpeggio bf'16( ~ |
    bf16 af,8 af'8 bf,16) <af, df,>4. |
    <df, af' f'>16\noBeam c'''8( g,8 bf'16 ~ bf af,8 af'8 bf,16) <af, df,>4. |
  \voiceTwo
    <af df,>16[ f'16 ef'16 af,16( f'16 \shape #' ((-0.5 . -0.25)(-0.5 . -0.25)(0 . -0.25)(0 . -0.25)) Tie bf,16] ~ <bf df f>8[) c,,16( \shape #' ((-0.5 . -0.25)(-0.5 . -0.25)(0 . -0.25)(0 . -0.25)) Tie bf''16 ~ <bf df>16 c16]) |
    <cf, ff,>16[( ff,,16]) cf''16[( af'16 ef'16 \once\tieUp cf16] ~ <af cf ef>8[) bf,,16( af''16 ~ <af cf>16 bf16]) |
    <a, d,>16[( d,,16]) a''16( fs'16 cs'8]) <a cs, fs,>8[ <af cs,>16( e'16 ~ <cs e ~>16 af16] ~ <af e'>16[)( <b, b,>16]) e'16[( ds16] ~ ds16[) cs16] |
    \tuplet 3/2 8 { r16 df,,16[( af'16] f'16[ af,16 f'16]) } bf16^-( f'16^-) |
    \tuplet 3/2 8 { r16 df,,16[( af'16] f'16[ af,16 f'16]) bf16^- af16^- f'16^- } |
    r16 <df,, af'>16[( \omit TupletBracket \tuplet 3/2 8 { \set stemLeftBeamCount = #1 f'16 af,16 \set stemRightBeamCount = #1 f'16) \set stemLeftBeamCount = #1 bf16 af16 ff'16] } |
    <df,, af' f'>8\noBeam \tuplet 3/2 8 { c''16([ df16 \set stemRightBeamCount = #1 c16) \set stemLeftBeamCount = #1 <cf eff>16( bff16 cf16]) <df,, af'>16( ef''16 df16) 
  \set baseMoment = #(ly:make-moment 1/8)
      c16( df16 \set stemRightBeamCount = #1 c16 \set stemLeftBeamCount = #1 cf16 bff16 cf16) } |
  \clef bass
    \tuplet 3/2 8 { af16[( bff16 \set stemRightBeamCount = #1 f16  \set stemLeftBeamCount = #1 af16 ef16 \set stemRightBeamCount = #1 f16  \set stemLeftBeamCount = #1 cf16 df16 df,16] ~ } df4.) |
  \fine
}   

lowerThree = \relative c {
  \voiceFour
  \mergeDifferentlyDottedOn
    \partial 8 s8 |
    s2.*2
    s2.
    <gf df' bf'>2 s4 |
    s2.
    <gf df' bf'>2 s4 |
    gf''2 f4 |
    gf2 f4 |
  \voiceTwo
  \once \override NoteColumn.force-hshift = #0.75
    df4.( c4.) |
  \once \override NoteColumn.force-hshift = #0.2
    df4.(  c4.*1/3) e4 |
    e2 ds4 |
    e4 fs4 ds4 |
    s4. s8 d4 |
    s4. s8 c4 |
    s2.*4
  \mergeDifferentlyDottedOn
    s4. af4. |
    s4. af4 s8 |
    s4. af4 s8 |
    s2.
  \time 9/8
    s4.*3*6
 \time 3/4
    s4.*2*2
    s4.*3
  \time 3/4
   s2.*2
 \barNumberCheck #34
 \time 9/8
 \voiceFour
   s8*7 a4
 \time 3/8
   s8*3*3
 \time 3/4
   s2.
 \voiceOne
   s4. af,4.\fermata
}