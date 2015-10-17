class RankingController < ApplicationController
  def have
    @items = Item.joins("LEFT OUTER JOIN (SELECT COUNT('ownerships'.'item_id') AS count_item_id, item_id AS item_id FROM 'ownerships' WHERE 'ownerships'.'type' IN ('Have') GROUP BY 'ownerships'.'item_id') rank ON id = rank.item_id").order('count_item_id desc').limit(10)
  end

  def want
    @items = Item.joins("LEFT OUTER JOIN (SELECT COUNT('ownerships'.'item_id') AS count_item_id, item_id AS item_id FROM 'ownerships' WHERE 'ownerships'.'type' IN ('Want') GROUP BY 'ownerships'.'item_id') rank ON id = rank.item_id").order('count_item_id desc').limit(10)
  end
end
