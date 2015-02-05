require "grn_mini"
require "benchmark"
require "json"
require "csv"

GrnMini::tmpdb do
  STEP          = 1000
  MAX_N_RECORDS = 10000
  QUERY         = "日本語"
  REPEAT        = 100

  text_file = File.expand_path('../../../wikipedia-search/data/groonga/ja-pages.grn', __FILE__)
  entries = File.read(text_file)
  entries = JSON.parse(entries.lines[1..-1].join)
  while entries.size < MAX_N_RECORDS
    entries += entries
  end

  native_array  = []
  indexed_array = GrnMini::Array.new("Entries")
  results       = [
    CSV.generate_line(["n_records", "Array#grep", "GrnMini::Array#select"]),
  ]
  (STEP..MAX_N_RECORDS).step(STEP).each do |n_records|
    (n_records - native_array.size).times do
      entry = entries.shift
      native_array  << entry["text"]
      indexed_array << {text: entry["text"]}
    end

    puts "-- #{n_records} --"
    Benchmark.bm(16) do |benchmark|
      native_n_found_records  = -1
      indexed_n_found_records = -1
      native_report = benchmark.report("Array#grep") do
        REPEAT.times do
          native_n_found_records = native_array.grep(/#{QUERY}/).size
        end
      end
      indexed_report = benchmark.report("GrnMini::Array#select") do
        REPEAT.times do
          indexed_n_found_records = indexed_array.select("text:@#{QUERY}").size
        end
      end
      unless native_n_found_records == indexed_n_found_records
        raise "ERROR: different result!! (#{native_n_found_records} vs #{indexed_n_found_records})"
      end
      results << CSV.generate_line([
        indexed_array.size,
        native_report.real / REPEAT,
        indexed_report.real / REPEAT,
      ])
    end
  end

  puts "Statistics:"
  results.each do |row|
    puts row
  end
end
