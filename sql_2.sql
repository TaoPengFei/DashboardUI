SELECT
	* 
FROM
	(
		SELECT 
					fact_check.BegTime,
					fact_check.TableNo,
					dim_user.UserId,
					dim_user.UserName,
					dim_outlet.ShopId,
					dim_outlet.ShopName,
					dim_item.ItemId,
					dim_item.ItemName, 
					sum(fact_checkitem.ItemSaleQty) as Itemsaleqties,
					format(sum(fact_checkitem.ItemSaleAmt),2) as Itemsaleamts,
					format(sum(fact_checkitem.ItemOrigSalePrice),2) as Itemosprice,
					format(sum(fact_checkitem.ItemSalePrice),2) as Itemsprice,
					format(sum(fact_checkitem.ItemSaleAmt),2) as Saleamts      
		FROM fact_checkitem
						inner join fact_check on fact_checkitem.OutletId = fact_check.OutletId and fact_checkitem.BIDateId = fact_check.BIDateId and fact_checkitem.CheckId = fact_check.CheckId
						inner join dim_item on fact_checkitem.ItemId_t = dim_item.ItemId_t
						inner join dim_outlet on fact_checkitem.OutletId_t = dim_outlet.OutletId_t
						inner join dim_area on dim_outlet.AreaId = dim_area.AreaId
						inner join dim_brand on dim_outlet.BrandId = dim_brand.BrandId
						inner join dim_place on dim_outlet.PlaceId = dim_place.PlaceId
						inner join dim_channel on dim_channel.ChannelId = fact_check.ChannelId
						inner join dim_user on dim_user.UserId = fact_check.CashierId
		WHERE fact_checkitem.BusinessDate  BETWEEN '2017-04-01' AND '2017-04-01'
		GROUP BY 
					fact_check.BegTime,
					fact_check.TableNo,
					dim_user.UserId,
					dim_user.UserName,
					dim_outlet.ShopId,
					dim_outlet.ShopName,
					dim_item.ItemId,
					dim_item.ItemName
		-- ORDER BY fact_check.BegTime,fact_check.TableNo,dim_user.UserId,dim_outlet.ShopId,dim_item.ItemId 
	UNION ALL
		SELECT 
					fact_check.BegTime,
					fact_check.TableNo,
					dim_user.UserId,
					dim_user.UserName,
					dim_outlet.ShopId,
					dim_outlet.ShopName,
					-- dim_item.ItemId,
					-- dim_item.ItemName,
					SUM(dim_item.ItemId),
					'小计',
					sum(fact_checkitem.ItemSaleQty) as Itemsaleqties,
					format(sum(fact_checkitem.ItemSaleAmt),2) as Itemsaleamts,
					format(sum(fact_checkitem.ItemOrigSalePrice),2) as Itemosprice,
					format(sum(fact_checkitem.ItemSalePrice),2) as Itemsprice,
					format(sum(fact_checkitem.ItemSaleAmt),2) as Saleamts      
		FROM fact_checkitem
						inner join fact_check on fact_checkitem.OutletId = fact_check.OutletId and fact_checkitem.BIDateId = fact_check.BIDateId and fact_checkitem.CheckId = fact_check.CheckId
						inner join dim_item on fact_checkitem.ItemId_t = dim_item.ItemId_t
						inner join dim_outlet on fact_checkitem.OutletId_t = dim_outlet.OutletId_t
						inner join dim_area on dim_outlet.AreaId = dim_area.AreaId
						inner join dim_brand on dim_outlet.BrandId = dim_brand.BrandId
						inner join dim_place on dim_outlet.PlaceId = dim_place.PlaceId
						inner join dim_channel on dim_channel.ChannelId = fact_check.ChannelId
						inner join dim_user on dim_user.UserId = fact_check.CashierId
		WHERE fact_checkitem.BusinessDate  BETWEEN '2017-04-01' AND '2017-04-01'
		GROUP BY 
					fact_check.BegTime,
					fact_check.TableNo,
					dim_user.UserId,
					dim_user.UserName,
					dim_outlet.ShopId,
					dim_outlet.ShopName
		-- ORDER BY fact_check.BegTime,fact_check.TableNo,dim_user.UserId,dim_outlet.ShopId,dim_item.ItemId 
		-- ORDER BY fact_check.BegTime,fact_check.TableNo,dim_user.UserId,dim_outlet.ShopId
	) AS tmp ORDER BY tmp.BegTime,tmp.TableNo,tmp.UserId,tmp.ShopId,tmp.ItemId 