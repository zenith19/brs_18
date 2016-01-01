def _dump_errors exception
  n=80
  n.times {print "#"}
  puts "\nInvalid argument(s)"
  puts exception.message
  n.times {print "#"}
  puts ""
end