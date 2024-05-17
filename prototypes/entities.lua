createdata("arithmetic-combinator","arithmetic-combinator",prototype,{
    activity_led_sprites=data.raw["arithmetic-combinator"]["arithmetic-combinator"].activity_led_sprites
})

data.raw["arithmetic-combinator"][prototype].multiply_symbol_sprites = {
  north = util.draw_as_glow
    {
      filename = "__"..modname.."__/graphics/entity/combinator/combinator-displays.png",
      x = 45,
      width = 15,
      height = 11,
      shift = util.by_pixel(0, -4.5),
      hr_version =
      {
        scale = 0.5,
        filename = "__"..modname.."__/graphics/entity/combinator/hr-combinator-displays.png",
        x = 90,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      }
    },
  east = util.draw_as_glow
    {
      filename = "__"..modname.."__/graphics/entity/combinator/combinator-displays.png",
      x = 45,
      width = 15,
      height = 11,
      shift = util.by_pixel(0, -10.5),
      hr_version =
      {
        scale = 0.5,
        filename = "__"..modname.."__/graphics/entity/combinator/hr-combinator-displays.png",
        x = 90,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
    },
  south = util.draw_as_glow
    {
      filename = "__"..modname.."__/graphics/entity/combinator/combinator-displays.png",
      x = 45,
      width = 15,
      height = 11,
      shift = util.by_pixel(0, -4.5),
      hr_version =
      {
        scale = 0.5,
        filename = "__"..modname.."__/graphics/entity/combinator/hr-combinator-displays.png",
        x = 90,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -4.5)
      }
    },
  west = util.draw_as_glow
    {
      filename = "__"..modname.."__/graphics/entity/combinator/combinator-displays.png",
      x = 45,
      width = 15,
      height = 11,
      shift = util.by_pixel(0, -10.5),
      hr_version =
      {
        scale = 0.5,
        filename = "__"..modname.."__/graphics/entity/combinator/hr-combinator-displays.png",
        x = 90,
        width = 30,
        height = 22,
        shift = util.by_pixel(0, -10.5)
      }
    }
}

createdata("arithmetic-combinator","arithmetic-combinator",ghost_merge_signals_provider,{
    draw_circuit_wires=false
  },true)
table.insert(data.raw["arithmetic-combinator"][ghost_merge_signals_provider].flags,"placeable-off-grid")
data.raw["arithmetic-combinator"][ghost_merge_signals_provider].collision_mask={"not-colliding-with-itself"}