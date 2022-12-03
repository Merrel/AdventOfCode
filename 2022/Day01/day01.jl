
using Chain

# Setup
dir_day = @__DIR__
f = dir_day * "/input.txt"
s = read(f, String)

# Parsing
function read_elf_snacks(snack_string)
    @chain snack_string begin
        split('\n')
        parse.(Int, _)
        sum
    end
end

# Processing
elves = []

for snack_string in eachsplit(s, "\n\n")
    push!(elves, read_elf_snacks(snack_string))
end

top_elf = maximum(elves)
top_three_total = sum(sort(elves, rev=true)[1:3])

# Reporting
println("The elf with the most snacks is carrying $top_elf calories.")
println("The top three elves are carrying $top_three_total calories of snackes in aggregation.")





