module Display
    def yellow_circle
        "\e[33m\u25cf\e[0m"
    end

    def blue_circle
        "\e[34m\u25cf\e[0m"
    end

    def empty_circle
        "\u25cb"
    end

    def display_grid(grid)
       grid.each do |row|
           puts row.join("  ")
       end
       puts (1..7).to_a.join("  ")
    end

    def description
        puts "#########----This is the connect four game-----#########"
    end
end
