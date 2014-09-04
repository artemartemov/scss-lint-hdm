module SCSSLint
  # Checks that selector sequences are split over multiple lines by comma.
  class Linter::SingleLinePerSelector < Linter
    include LinterRegistry

    MESSAGE = 'Each selector in a comma sequence should be on its own line'

    def visit_comma_sequence(node)
      return unless node.members.count > 1

      if node.members[0].members[1] == "\n"
        # Comma is on its own line
        add_lint(node, MESSAGE)
      end

      node.members[1..-1].each_with_index do |sequence, index|
        if sequence.members[0] != "\n"
          # Next sequence doesn't reside on its own line
          add_lint(node.line + index, MESSAGE)
        elsif sequence.members[1] == "\n"
          # Comma is on its own line
          add_lint(node.line + index, MESSAGE)
        end
      end
    end
  end
end
