select  Begtime,
			Tableno,
			Username,
			Shopname,
			Itemname, 
			Itemsaleqties,
			Itemsaleamts,
			Itemosprice,
			Itemsprice,
			Saleamts
from (			
select    
		  x.BegTime as Begtime,
			x.TableNo as Tableno,
			i.UserName as Username,
			b.ShopName as Shopname,
			f.ItemName as Itemname, 
			a.ItemSaleQty as Itemsaleqties,
			a.ItemSaleAmt as Itemsaleamts,
			a.ItemOrigSalePrice as Itemosprice,
			a.ItemSalePrice as Itemsprice,
			a.ItemSaleAmt as Saleamts ,
			f.ItemId as itemid
    from fact_checkitem a
				inner join fact_check x on a.OutletId = x.OutletId and a.BIDateId = x.BIDateId and a.CheckId = x.CheckId
				inner join dim_item f on a.ItemId_t = f.ItemId_t
				inner join dim_outlet b on a.OutletId_t = b.OutletId_t
				inner join dim_area c on b.AreaId = c.AreaId
				inner join dim_brand d on b.BrandId = d.BrandId
				inner join dim_place e on b.PlaceId = e.PlaceId
        inner join dim_channel h on h.ChannelId = x.ChannelId
        inner join dim_user i on i.UserId = x.CashierId
  where a.BusinessDate BETWEEN '2017-04-01' AND '2017-04-01'
  and x.BusinessDate BETWEEN '2017-04-01' AND '2017-04-01'
union all
select 	
		  x.BegTime as Begtime,
			x.TableNo as Tableno,
			i.UserName as Username,
			b.ShopName as Shopname,
			'小计' as Itemname, 
			sum(a.ItemSaleQty) as Itemsaleqties,
			format(sum(a.ItemSaleAmt),2) as Itemsaleamts,
			format(sum(a.ItemOrigSalePrice),2) as Itemosprice,
			format(sum(a.ItemSalePrice),2) as Itemsprice,
			format(sum(a.ItemSaleAmt),2) as Saleamts ,
			sum(f.ItemId) as itemid			
    from fact_checkitem a
				inner join fact_check x on a.OutletId = x.OutletId and a.BIDateId = x.BIDateId and a.CheckId = x.CheckId
				inner join dim_item f on a.ItemId_t = f.ItemId_t
				inner join dim_outlet b on a.OutletId_t = b.OutletId_t
				inner join dim_area c on b.AreaId = c.AreaId
				inner join dim_brand d on b.BrandId = d.BrandId
				inner join dim_place e on b.PlaceId = e.PlaceId
        inner join dim_channel h on h.ChannelId = x.ChannelId
        inner join dim_user i on i.UserId = x.CashierId
  where a.BusinessDate BETWEEN '2017-04-01' AND '2017-04-01'
  and x.BusinessDate BETWEEN '2017-04-01' AND '2017-04-01'
group by x.checkid,x.BegTime,
			x.TableNo,
			i.UserName,
			b.ShopName
union all			
select  
		  '合计' as Begtime,
			'合计' as Tableno,
			'合计' as Username,
			'合计' as Shopname,
			'合计' as Itemname, 
			sum(a.ItemSaleQty) as Itemsaleqties,
			format(sum(a.ItemSaleAmt),2) as Itemsaleamts,
			format(sum(a.ItemOrigSalePrice),2) as Itemosprice,
			format(sum(a.ItemSalePrice),2) as Itemsprice,
			format(sum(a.ItemSaleAmt),2) as Saleamts ,
			sum(f.ItemId) as itemid		
    from fact_checkitem a
				inner join fact_check x on a.OutletId = x.OutletId and a.BIDateId = x.BIDateId and a.CheckId = x.CheckId
				inner join dim_item f on a.ItemId_t = f.ItemId_t
				inner join dim_outlet b on a.OutletId_t = b.OutletId_t
				inner join dim_area c on b.AreaId = c.AreaId
				inner join dim_brand d on b.BrandId = d.BrandId
				inner join dim_place e on b.PlaceId = e.PlaceId
        inner join dim_channel h on h.ChannelId = x.ChannelId
        inner join dim_user i on i.UserId = x.CashierId
  where a.BusinessDate BETWEEN '2017-04-01' AND '2017-04-01'
  and x.BusinessDate BETWEEN '2017-04-01' AND '2017-04-01'	) a1
order by Begtime,
			Tableno,
			Username,
			Shopname,
			itemid
