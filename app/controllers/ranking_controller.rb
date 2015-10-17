class RankingController < ApplicationController
  def have
    @items = Item.joins("LEFT OUTER JOIN (SELECT COUNT(item_id) AS count_item_id, item_id AS item_id FROM ownerships WHERE type IN ('Have') GROUP BY item_id) rank ON id = rank.item_id").order('count_item_id desc').limit(10)
  end

  def want
    @items = Item.joins("LEFT OUTER JOIN (SELECT COUNT(item_id) AS count_item_id, item_id AS item_id FROM ownerships WHERE type IN ('Want') GROUP BY item_id) rank ON id = rank.item_id").order('count_item_id desc').limit(10)
  end
end
