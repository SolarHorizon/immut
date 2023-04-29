# About

Immut offers a simpler way to deal with immutable data structures. Unlike other
libraries which can sometimes require a substantial amount of boilerplate to
achieve your desired end result, Immut allows you to write code in the same way
you would if you weren't concerned with immutability.

## Comparison

Let's imagine we're making a game that has an immutable inventory system. We're
going to decrease the durability of the player's sword by 10 and give them a
health potion.

```lua
local inventory = {
    weapons = {
        sword = {
            damage = 10,
            durability = 100,
        },
    },
    consumables = {
        staminaPotion = {
            value = 100,
            stamina = 20,
        },
    },
}
```

### Manually

We can opt to do this ourselves by using `table.clone`, but we will need to be
careful and make sure that we clone any table we intend to make changes to.
This gets more and more difficult the deeper your state is nested.

```lua
local newInventory = table.clone(inventory)

-- let's handle the sword first
newInventory.weapons = table.clone(inventory.weapons)
newInventory.weapons.sword = table.clone(newInventory.weapons.sword)
newInventory.weapons.sword.durability -= 10

-- now for the potion
newInventory.consumables = table.clone(inventory.consumables)
newInventory.consumables.healthPotion = {
    value = 100,
    health = 20,
}
```

### Other libraries

There's a few existing libraries that can help us out with this. They do a
great job and make solving this problem way easier. Unfortunately, just like
the manual method, they do have a bit of boilerplate. In this example, we're
not using a specific library, but we're copying some common patterns they use.

```lua
local Immutable = require(ReplicatedStorage.Immutable)

local Dictionary = Immutable.Dictionary

local newInventory = Dictionary.merge(inventory, {
    weapons = Dictionary.merge(inventory.weapons, {
        sword = Dictionary.update(
            inventory.weapons.sword,
            "durability",
            function(value)
                return value - 10
            end,
        )
    }),
    consumables = Dictionary.merge(inventory.consumables, {
        healthPotion = {
            value = 100,
            health = 20,
        }
    })
})

```

### Immut

With Immut, we can solve this problem as if we weren't concerned with mutation
at all. This makes it trivial.

```lua
local Immut = require(ReplicatedStorage.Immut)

local newInventory = Immut.produce(inventory, function(draft)
    draft.weapons.sword.durability -= 10
    draft.consumables.healthPotion = {
        value = 100,
        health = 20,
    }
end)
```

## How It Works

Immut makes use of metatables to hide a lot of the complexity of working with
immutable data in Luau. The first time you make a change to a draft, the
original table is cloned and your changes are applied to that clone. When
reading values from a draft, it will first try to read from a clone, and fall
back to the original table if one doesn't exist. Immut won't clone anything if
it doesn't need to.

## Some caveats

- A draft is not the same as your original table! Keep that in mind when
  directly comparing two tables inside of a producer.

  ```lua
  produce(state, function(draft)
      print(state == draft) -- false
  end)

  produce(state, function(draft)
      print(original(draft) == state) -- true
  end)
  ```

- Nested tables are automatically turned into drafts. This can be convenient
  when dealing with nested state, like in our example above, but may not always
  be what you want. To remedy this, you can opt out of using a draft with
  `Immut.original`.

- Functions from Luau's built-in table library do not respect metatables. If
  you want to use them, Immut comes with `Immut.table` which offers some
  draft-safe replacements with the same functionality.
