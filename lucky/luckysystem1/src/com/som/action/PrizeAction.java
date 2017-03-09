package com.som.action;

import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.som.entity.ExRecord;
import com.som.entity.Prize;
import com.som.service.ExRecordService;
import com.som.service.PrizeService;
import com.som.util.ImportExcelUtil;




@Controller
@SessionAttributes("inputNum")
@RequestMapping(value = "/prize")
public class PrizeAction {

	@Resource
	private PrizeService prizeService;
	@Resource
	private ExRecordService exRecordService;
	@ResponseBody  
    @RequestMapping(value="/insertPrizes.action",method={RequestMethod.GET,RequestMethod.POST})  
    public  void  ajaxUploadExcel(HttpServletRequest request,HttpServletResponse response) throws Exception {  
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    
          
        System.out.println("通过 jquery.form.js 提供的ajax方式上传文件！");  
          
        InputStream in =null;  
        List<List<Object>> listob = null;  
        MultipartFile file = multipartRequest.getFile("upfile");  
        if(file.isEmpty()){  
            throw new Exception("文件不存在！");  
        }  
          
        in = file.getInputStream();  
        listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());  
          
        //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出  
        for (int i = 0; i < listob.size(); i++) {  
            List<Object> lo = listob.get(i);  
            Prize vo = new Prize();  
            vo.setGrade(String.valueOf(lo.get(0)));
            vo.setSponsor(String.valueOf(lo.get(1)));
            vo.setProductname(String.valueOf(lo.get(2)));
            vo.setUnitprice(String.valueOf(lo.get(3)));
            vo.setCount(String.valueOf(lo.get(4)));
            vo.setTotalvalue(String.valueOf(lo.get(5)));
            prizeService.addPrize(vo);
              
            System.out.println("打印信息-->Grade = " + vo.getGrade() + " , Sponsor = " + vo.getSponsor() + ","
						+ " Productname = " + vo.getProductname() +"Unitprice"+vo.getUnitprice()+"Count"+vo.getCount()
						+"Totalvalue"+vo.getTotalvalue());  
        }  
          
        PrintWriter out = null;  
        response.setCharacterEncoding("utf-8");  //防止ajax接受到的中文信息乱码  
        out = response.getWriter();  
        out.print("文件导入成功！");  
        out.flush();  
        out.close();  
    }  
	
	@RequestMapping(value="/outExcell.action")
	public String outExcell(Model model){
		List<Prize> prizes = prizeService.findAllPrizes();
		model.addAttribute("prizes",prizes);
		return "/excell.jsp";
	}
	
	/*
	 * Springmvc 返回json数据数据，
	 * */
	@ResponseBody 
	@RequestMapping(value="/findAllPrizes2.action")
	public List<Prize> findAllPrizesJson(Model model){
		List<Prize> prizes = prizeService.findAllPrizes();
		//model.addAttribute("prizes",prizes);
		return prizes;
	} 
	@RequestMapping(value="/findAllPrizes.action")
	public String findAllPrizes(Model model){
		List<Prize> prizes = prizeService.findAllPrizes();
		model.addAttribute("prizes",prizes);
		return "/prize_list.jsp";
	}
	@RequestMapping(value="/findPrizesByGrade")
	public String findPrizesByGrade(Model model,String grade){
		List<Prize> prizes=prizeService.findPrizeByGrade(grade);
		model.addAttribute("prizes", prizes);
		return "/prize_list.jsp";
	}
	
	@RequestMapping(value="/exchangePrizeById")
	public String exchangePrizeById(int id ,@ModelAttribute("inputNum")String inputNum,SessionStatus sessionStatus){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 	Prize prize = prizeService.findPrizeById(id);
	 	System.out.println(prize.toString());
	 	if(exRecordService.findByExnum(inputNum)!=null){
	 		return "/noQualification.jsp";
	 	}
	 	if(prize!=null){
	 		ExRecord exRecord = new ExRecord();
	 		String exdate=df.format(new Date());
	 		String exnum=inputNum;
	 		String exproduct=prize.getProductname();
	 		
	 		
	 		exRecord.setExdate(exdate);
	 		exRecord.setExnum(exnum);
	 		exRecord.setExproduct(exproduct);
	 		
	 		System.out.println(exRecord.toString());
	 		exRecordService.addExRecord(exRecord);
	 		
	 		if(Integer.parseInt(prize.getCount())==1){
		 		prizeService.deletePrizeById(id);
		 	}
	 		
		 	else{
		 		int x=Integer.parseInt(prize.getCount());
		 		x=x-1;
		 		prize.setCount(String.valueOf(x));
		 		prizeService.updatePrize(prize);
		 	}
	 	}
	 	sessionStatus.setComplete();
	 	System.out.println("11");
		return "forward:/prize/findAllPrizes.action";
		
	}
}
