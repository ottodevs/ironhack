class Lexiconomitron
  def eat_t(s)
    s.delete('tT')
  end

  def shazam(a)
    [eat_t(a.first), eat_t(a.last)]
    .map! { |w| w.reverse }
  end

  def oompa_loompa(a)
    a.keep_if { |w| w.size < 4 }
    .each { |w| eat_t(w) }
  end
end
