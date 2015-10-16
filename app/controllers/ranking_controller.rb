class RankingController < ApplicationController
  def have
    have = Have.group('item_id').limit(10).order('count_item_id desc').count('item_id').keys
    @items = Item.find(have)
    
  end

  def want
    want = Want.group('item_id').limit(10).order('count_item_id desc').count('item_id').keys
    @items = Item.find(want)
  end
end
