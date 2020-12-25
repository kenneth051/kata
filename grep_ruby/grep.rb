# Search a file for lines matching a regular expression pattern. Return the line number and contents of each matching line.
# Your task is to implement the grep function, which should read the contents of the specified files, find the lines that match the specified pattern 
# and then output those lines as a single string. Note that the lines should be output in the order in which they were found,
# with the first matching line in the first file being output first.
# As an example, suppose there is a file named "input.txt" with the following contents:

#     hello
#     world
#     hello again
# If we were to call grep "hello" input.txt, the returned string should be:
#     hello
#     hello again

# Flags
# As said earlier, the grep command should also support the following flags:    
#     -n Print the line numbers of each matching line.
#     -l Print only the names of files that contain at least one matching line.
#     -i Match line using a case-insensitive comparison.
#     -x Only match entire lines, instead of lines that contain a match.

# should support multiple flags at once

#introduction to files
#refactoring big functions

class Grep
    def initialize(keyword,file,flags)
        @keyword =keyword
        @file = file
        @matched_lines =[]
        @matched_files =[]
        @flags =flags
    end

    def matches
        return @matched_files.uniq if match_filenames?
        @matched_lines
    end
    def case_sensitive?
        @flags.include?("-i")
    end
    def matches_entire_line?
        @flags.include?("-x")
    end
    def match_filenames?
        @flags.include?("-l")
    end

    def pattern
        Regexp.new @keyword, (Regexp::IGNORECASE if case_sensitive?)
    end

    def with_line_number_flag(line,line_index)
        if @flags.include?("-n")
            line ="line#{line_index+1}: #{line}"
        end
        line
    end

    def save_matches(line, file)
        @matched_lines << line
        @matched_files << file
    end

    def matches_line_only(line, file)
        if !matches_entire_line? && line.match?(pattern)
            save_matches(line, file)
        end
    end

    def matches_entire_line_only(line, file)
        if matches_entire_line? &&(line.downcase == @keyword.downcase)&& line.match?(pattern)
            save_matches(line, file)
        end
    end

    def search_matches
        @file.map do|file|
            f = File.open(file,"r")
            f.each_with_index do|line, line_index|
                line =line.strip
                line_number = with_line_number_flag(line, line_index)
                matches_line_only(line_number, file)
                matches_entire_line_only(line_number, file)
            end
            f.close
        end
    end

end

#feedback
#1 function names