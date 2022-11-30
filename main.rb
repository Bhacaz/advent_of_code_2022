require 'benchmark'
require 'byebug'

day = ARGV[0].rjust(2, '0')
part = ARGV[1]

part_path = "day#{day}/part#{part}"

require_relative 'base_part'
require_relative part_path

result = nil
allocated = 0
measure = Benchmark.measure do
  allocated = GC.stat(:total_allocated_objects)
  result = Part.run
  allocated = GC.stat[:total_allocated_objects] - allocated
end

duration = (measure.real * 1000).round(2)

result_table = <<~result
-------- Day: #{day}, Part: #{part} --------
| Duration\t| #{duration} ms\t|
| Allocated\t| #{allocated}\t\t|
| Result\t| #{result}\t|
---------------------------------
result

puts result_table

text = File.read(part_path + '.rb')
result_comment = result_table.split("\n").map { |line| '# ' + line }.join("\n")

if text[-4..].include?('end')
  File.open(part_path + '.rb', 'w') { |file| file << text + "\n" + result_comment + "\n" }
else
  text_split = text.split("\n")
  text_split.slice!(-5..)
  File.open(part_path + '.rb', 'w') { |file| file << text_split.join("\n") + "\n" + result_comment + "\n" }
end
