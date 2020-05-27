package com.asiainfo.cmc.service.impl.brandmodel;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.brandmodel.AbsoluteLine;
import com.asiainfo.cmc.enties.brandmodel.AbsoluteRange;
import com.asiainfo.cmc.enties.brandmodel.DoublePrice;
import com.asiainfo.cmc.enties.brandmodel.ImportantProduct;
import com.asiainfo.cmc.enties.brandmodel.LifeDate;
import com.asiainfo.cmc.enties.brandmodel.OderZhi;
import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.enties.brandmodel.ShareFen;
import com.asiainfo.cmc.enties.brandmodel.StockSet;
import com.asiainfo.cmc.mapper.brandmodel.AbsoluteRangeMapper;
import com.asiainfo.cmc.service.brandmodel.AbsoluteRangeService;

@Service
@Transactional
public class AbsoluteRangeServiceImpl implements AbsoluteRangeService {

	 @Resource
	 private  AbsoluteRangeMapper absoluteRangeMapper;
	
	
	@Override
	public List<AbsoluteRange> selectEveryDay(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectEveryDay(start, end, brand, model);
	}

	@Override
	public List<AbsoluteRange> selectEveryMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectEveryMonth(start, end, brand, model);
	}

	@Override
	public int selectHowDay(String start, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectHowDay(start, brand, model);
	}

	@Override
	public int selectHowDays(String start, String end) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectHowDays(start, end);
	}

	@Override
	public List<LifeDate> selectBrandLife(String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectBrandLife(brand, model);
	}

	@Override
	public int selectMonthRange(String start, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectMonthRange(start, brand, model);
	}

	@Override
	public int selectMonthDiffer(String start, String end) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectMonthDiffer(start, end);
	}

	@Override
	public List<AbsoluteRange> selectDayDate(String start,String end,String brand,String model,String brand1,String model1) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectDayDate(start, end,brand, model, brand1, model1 );
	}

	@Override
	public List<AbsoluteRange> selectMonthDate(String start,String end,String brand,String model,String brand1,String model1) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectMonthDate( start, end,brand, model, brand1, model1);
	}

	@Override
	public List<AbsoluteRange> selectDayDate1(String start,String end,String brand,String model,String brand2,String model2) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectDayDate1(start, end,brand, model, brand2, model2 );
	}

	@Override
	public List<AbsoluteRange> selectMonthDate1(String start,String end,String brand,String model,String brand1,String model1) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectMonthDate1(start, end,brand, model, brand1, model1);
	}

	@Override
	public List<AbsoluteLine> selectFiveDate(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectFiveDate(start, end,brand, model);
	}

	@Override
	public List<AbsoluteLine> selectFiveMonthDate(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectFiveMonthDate(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectAreaDay(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectAreaDay(start, end, brand, model);
	}

	@Override
	public List<AbsoluteRange> selectAreaMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectAreaMonth(start, end, brand, model);
	}

	@Override
	public List<AbsoluteRange> selectSayDay(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectSayDay(start, end, brand, model);
	}

	@Override
	public List<AbsoluteRange> selectSayDay1(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectSayDay1(start, end, brand, model);
	}

	@Override
	public List<AbsoluteRange> selectSayMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectSayMonth(start, end, brand, model);
	}

	@Override
	public List<AbsoluteRange> selectSayMonth1(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectSayMonth1(start, end, brand, model);
	}

	@Override
	public List<AbsoluteRange> selectIncomeDay(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectIncomeDay(start, end, brand, model);
	}

	@Override
	public List<AbsoluteRange> selectIncomeMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectIncomeMonth(start, end, brand, model);
	}

	@Override
	public String selectSerachDay(String start, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectSerachDay(start, brand, model);
	}

	@Override
	public List<AbsoluteRange> selectIncomeDays(String start,String end,String brand,String model,String brand1,String model1) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectIncomeDays(start, end,brand, model, brand1, model1);
	}

	@Override
	public List<AbsoluteRange> selectIncomeMonths(String start,String end,String brand,String model,String brand1,String model1) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectIncomeMonths(start, end,brand, model, brand1, model1);
	}

	@Override
	public List<AbsoluteRange> selectComeDays(String start,String end,String brand,String model,String brand2,String model2) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectComeDays(start, end,brand, model, brand2, model2);
	}

	@Override
	public List<AbsoluteRange> selectComeMonth(String start,String end,String brand,String model,String brand2,String model2) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectComeMonth(start, end,brand, model, brand2, model2);
	}

	@Override
	public List<AbsoluteLine> selectFive(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectFive(start, end,brand, model);
	}

	@Override
	public List<AbsoluteLine> selectFiveMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectFiveMonth(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectAreaFiveDay(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectAreaFiveDay(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectAreaFiveMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectAreaFiveMonth(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectIncomes(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectIncomes(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectIncomeDayed(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectIncomeDayed(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectIncomeMonthed(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectIncomeMonthed(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectIncomeMonthes(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectIncomeMonthes(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectProfitDay(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectProfitDay(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectProfitMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectProfitMonth(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectProductProfitDay(String start,String end,String brand,String model,String brand1,String model1) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectProductProfitDay(start, end,brand, model, brand1, model1);
	}

	@Override
	public List<AbsoluteRange> selectProductProfitMonth(String start,String end,String brand,String model,String brand1,String model1) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectProductProfitMonth(start, end,brand, model, brand1, model1);
	}

	@Override
	public List<AbsoluteRange> selectCompetitiveProductDay(String start,String end,String brand,String model,String brand2,String model2) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectCompetitiveProductDay(start, end,brand, model, brand2, model2);
	}

	@Override
	public List<AbsoluteRange> selectCompetitiveProductMonth(String start,String end,String brand,String model,String brand2,String model2) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectCompetitiveProductMonth(start, end,brand, model, brand2, model2);
	}

	@Override
	public List<AbsoluteLine> selectProfitDays(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectProfitDays(start, end,brand, model);
	}

	@Override
	public List<AbsoluteLine> selectProfitMonths(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectProfitMonths(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectCityDay(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectCityDay(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectCityMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectCityMonth(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectTrendDay(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectTrendDay(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectLastYearTrendDays(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectLastYearTrendDays(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectTrendMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectTrendMonth(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectLastYearTrendMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectLastYearTrendMonth(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectPriceDay(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectPriceDay(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectPriceMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectPriceMonth(start, end,brand, model);
	}

	@Override
	public List<DoublePrice> selectPriceDoubleDay(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectPriceDoubleDay(start, end,brand, model);
	}

	@Override
	public List<DoublePrice> selectPriceDoubleMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectPriceDoubleMonth(start, end,brand, model);
	}

	@Override
	public List<DoublePrice> selectPriceDoubleCompetitive(String start,String end,String brand1,String model1) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectPriceDoubleCompetitive( start, end,brand1, model1);
	}

	@Override
	public List<DoublePrice> selectPriceDoubleCompetitiveMonth(String start,String end,String brand1,String model1) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectPriceDoubleCompetitiveMonth( start, end,brand1, model1);
	}

	@Override
	public List<AbsoluteRange> selectPriceDays(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectPriceDays(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectPriceMonths(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectPriceMonths(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectNowPrice(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectNowPrice(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectLastYearPrice(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectLastYearPrice(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectNowPriceMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectNowPriceMonth(start, end,brand, model);
	}

	@Override
	public List<AbsoluteRange> selectLastYearPriceMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectLastYearPriceMonth(start, end,brand, model);
	}

	@Override
	public List<OverCustomer> selectAccumulativeDay(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectAccumulativeDay(start, end,brand, model);
	}

	@Override
	public List<OverCustomer> selectAccumulativeMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectAccumulativeMonth(start, end,brand, model);
	}

	@Override
	public List<StockSet> selectDepositDay(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectDepositDay(start, end,brand, model);
	}

	@Override
	public List<StockSet> selectDepositMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectDepositMonth(start, end,brand, model);
	}

	@Override
	public List<ShareFen> selectShareDay(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectShareDay(start, end,brand, model);
	}

	@Override
	public List<ShareFen> selectShareMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectShareMonth(start, end,brand, model);
	}

	@Override
	public List<OderZhi> selectLocalDay(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectLocalDay(start, end,brand, model);
	}

	@Override
	public List<OderZhi> selectLocalMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectLocalMonth(start, end,brand, model);
	}

	@Override
	public List<OderZhi> selectDifferentDay(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectDifferentDay(start, end,brand, model);
	}

	@Override
	public List<OderZhi> selectDifferentMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectDifferentMonth(start, end,brand, model);
	}

	@Override
	public List<OderZhi> selectDoubtfulDay(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectDoubtfulDay(start, end,brand, model);
	}

	@Override
	public List<OderZhi> selectDoubtfulMonth(String start,String end,String brand,String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectDoubtfulMonth(start, end,brand, model);
	}

	@Override
	public List<ImportantProduct> selectListImportant(String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectListImportant(brand, model);
	}

	@Override
	public List<AbsoluteLine> selectPriceDate(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectPriceDate(start, end, brand, model);
	}

	@Override
	public List<AbsoluteLine> selectPriceMonthDate(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectPriceMonthDate(start, end, brand, model);
	}

	@Override
	public List<StockSet> selectLastYear(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectLastYear(start, end, brand, model);
	}

	@Override
	public List<StockSet> selectLastYearMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectLastYearMonth(start, end, brand, model);
	}

	@Override
	public List<StockSet> cunAreaDay(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.cunAreaDay(start, end, brand, model);
	}

	@Override
	public List<StockSet> cunAreaMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.cunAreaMonth(start, end, brand, model);
	}

	@Override
	public List<ShareFen> selectShareDayNow(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectShareDayNow(start, end, brand, model);
	}

	@Override
	public List<ShareFen> selectShareYearDayNow(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectShareYearDayNow(start, end, brand, model);
	}

	@Override
	public List<ShareFen> selectSayMonthNow(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectSayMonthNow(start, end, brand, model);
	}

	@Override
	public List<ShareFen> selectSayYearMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectSayYearMonth(start, end, brand, model);
	}

	@Override
	public List<ShareFen> selectAreaShareDay(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectAreaShareDay(start, end, brand, model);
	}

	@Override
	public List<ShareFen> selectAreaShareMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectAreaShareMonth(start, end, brand, model);
	}

	@Override
	public List<OverCustomer> selectCoverDayNow(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectCoverDayNow(start, end, brand, model);
	}

	@Override
	public List<OverCustomer> selectCoverYearDayNow(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectCoverYearDayNow(start, end, brand, model);
	}

	@Override
	public List<OverCustomer> selectCoverSayMonthNow(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectCoverSayMonthNow(start, end, brand, model);
	}

	@Override
	public List<OverCustomer> selectCoverSayYearMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectCoverSayYearMonth(start, end, brand, model);
	}

	@Override
	public List<OverCustomer> selectCoverAreaShareDay(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectCoverAreaShareDay(start, end, brand, model);
	}

	@Override
	public List<OverCustomer> selectCoverAreaShareMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectCoverAreaShareMonth(start, end, brand, model);
	}

	@Override
	public List<OderZhi> selectOrderDayNow(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectOrderDayNow(start, end, brand, model);
	}

	@Override
	public List<OderZhi> selectOrderYearDayNow(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectOrderYearDayNow(start, end, brand, model);
	}

	@Override
	public List<OderZhi> selectOrderSayMonthNow(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectOrderSayMonthNow(start, end, brand, model);
	}

	@Override
	public List<OderZhi> selectOrderSayYearMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectOrderSayYearMonth(start, end, brand, model);
	}

	@Override
	public List<OderZhi> selectOrderAreaShareDay(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectOrderAreaShareDay(start, end, brand, model);
	}

	@Override
	public List<OderZhi> selectOrderAreaShareMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectOrderAreaShareMonth(start, end, brand, model);
	}

	@Override
	public String selectTotalAmount(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectTotalAmount(start, end, brand, model);
	}

	@Override
	public Float selectTotalIncome(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectTotalIncome(start, end, brand, model);
	}

	@Override
	public Float selectTotalCustomer(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectTotalCustomer(start, end, brand, model);
	}

	@Override
	public Float selectTotalStore(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectTotalStore(start, end, brand, model);
	}

	@Override
	public String selectTotalAmountMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectTotalAmountMonth(start, end, brand, model);
	}

	@Override
	public Float selectTotalIncomeMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectTotalIncomeMonth(start, end, brand, model);
	}

	@Override
	public Float selectTotalCustomerMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectTotalCustomerMonth(start, end, brand, model);
	}

	@Override
	public Float selectTotalStoreMonth(String start, String end, String brand, String model) {
		// TODO Auto-generated method stub
		return absoluteRangeMapper.selectTotalStoreMonth(start, end, brand, model);
	}

}
