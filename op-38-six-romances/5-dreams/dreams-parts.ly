\version "2.24.4"
\language "english"

\include "paper.ily"
\include "vocal.ily"
\include "piano.ily"

\paper {
  page-count = #1
  systems-per-page = #8
}

\layout {
  \accidentalStyle piano
  \override TupletNumber.whiteout = ##t
}

\header {
  title = \markup {
    \override #'(font-features . ("smcp"))
    "Сон"
  }
  subtitle = "Dreams"
  %dedication = "Translation by Edward Agate"
  poet = \markup {
    \column {
      "Fyodor Sologub" %(Фёдор Сологу́б)
      \italic
        "Translation Edward Agate"
    }
  }
  dedication = "for Nina Koshits"
  titleRunner = "Сон"
  piece = "(Dreams)"
  composer = "Sergei Rachmaninoff"
  composerRunner = "Rachmaninoff"
  opus = "Opus 38.5"
  date = "1916"
  tagline = ##f
  % instrument = ""
}

\score {
  <<
    \new Staff = "Vox" \with { \consists "Ambitus_engraver" } <<
      \new Voice = "Vocal" \vox
      \include "lyrics.ily"
    >>
  >>
}
