class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        item.sell_in -= 1
        item.quality += (item.quality < 50 && item.sell_in < 0) ? 2 : 1
        item.quality = [50, item.quality].min
      when "Backstage passes to a TAFKAL80ETC concert"
        case item.sell_in
        when 11..49
          item.quality += 1
        when 6..10
          item.quality += 2
        when 1..5
          item.quality += 3
        when 0
          item.quality = 0
        end
        item.sell_in -= 1
        item.quality = [item.quality, 50].min
      when "Sulfuras, Hand of Ragnaros"
      else
        item.sell_in -= 1
        item.quality -= (item.sell_in < 0 && item.quality > 0) ? 2 : 1
        item.quality = [item.quality, 0].max
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
