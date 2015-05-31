Time::DATE_FORMATS[:googformat] = "%H:%M %p, %A, %B #{Time.now.day.ordinalize}, %Y (%Z)"
Time::DATE_FORMATS[:custom1] = "%B %e, %Y at %l:%M %p"

Time::DATE_FORMATS[:omar_format] = "#{Time.now.to_s(:long_ordinal)}:%S %p"
