// Adds pulverizing recipes for things that aren't normally pulverizable

ServerEvents.recipes(event => {
    console.log("Adding Pulverizer recipes...")

    event.custom({
        type: 'indrev:pulverize',
        ingredients: {
            tag: 'c:zinc_ores'
        },
        output: {
            item: 'techreborn:zinc_dust',
            count: 3
        },
        processTime: 200
    })
    event.custom({
        type: 'indrev:pulverize',
        ingredients: {
            tag: 'minecraft:redstone_ores'
        },
        output: {
            item: 'minecraft:redstone',
            count: 7
        },
        processTime: 200
    })
    event.custom({
        type: 'indrev:pulverize',
        ingredients: {
            tag: 'c:lignite_coal_ores'
        },
        output: {
            item: 'modern_industrialization:lignite_coal',
            count: 2
        },
        processTime: 200
    })
    event.custom({
        type: 'indrev:pulverize',
        ingredients: {
            tag: 'minecraft:lapis_ores'
        },
        output: {
            item: 'minecraft:lapis_lazuli',
            count: 10
        },
        processTime: 200
    })
})

