for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes
    recipes[recipe].enabled = technologies["circuit-network"].researched
end