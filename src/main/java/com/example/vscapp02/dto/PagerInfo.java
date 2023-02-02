package com.example.vscapp02.dto;

/**
 * Created by R on 2016-11-07.
 */
public class PagerInfo {
    /**
     * 현재페이지
     */

    private int currentPage = 1;
    private int pageTotal; //페이지 전체 갯수

    private int startPageIndex;//현재 보여지는 페이지의 첫번째 인덱스(1부터 시작)
    private int endPageIndex;//현재 보여지는 페이지의 마지막 인덱스(1부터 시작)
    private int blockPage = 5;//한화면에 보여줄 페이지의 수

    private int itemCountPerPage = 50;//페이지당 아이템 수
    private int itemCountTotal;//전체 아이템 수
    private int start;//SQL에서 사용할 LIMIT #{pager.start}, #{pager.itemCountPerPage} 과 연관.

    //현재 페이지를 파라미터 받는 생성자
    public PagerInfo(Integer currentPage) {
        //현재 페이지에 파라미터 값이 null이거나 1보다 작을 시, 1을 대입 아닐 시 파라미터 값이 현재 페이지가 됨.
        this.currentPage = (currentPage == null || currentPage < 1 ? 1 : currentPage);
        //현재페이지 -1 * 페이지당 아이템 수(50개) start에 대입
        this.start = computeStart();
    }

    public PagerInfo(Integer currentPage, Integer itemCountPerPage) {
        this.currentPage = currentPage < 1 ? 1 : currentPage;
        this.itemCountPerPage = itemCountPerPage;
        this.start = computeStart();
    }

    private int computeStart() {
        return (currentPage - 1) * itemCountPerPage;
    }


    //페이징
    public void setItemCountTotal(int itemCountTotal) {
        //전체 아이템 수 셋팅
        this.itemCountTotal = itemCountTotal;

        //몇개의 페이지가 나올 것인지 연산하는 과정
        //페이지 전체 갯수 = 전체 아이템 수 / 페이지당 아이템 수(50)의 나머지가 0이라면 전체 갯수 / 페이지당 아이템 수(50) : 전체 갯수 / 페이지당 아이템 수(50) +1
        this.pageTotal = (itemCountTotal % itemCountPerPage == 0 ? (itemCountTotal / itemCountPerPage) : (itemCountTotal / itemCountPerPage + 1));


        //현재 페이지를 5로 나눈 후 5를 곱한 후 +1을 하기에 1, 6, 11 순으로 시작함
        this.startPageIndex = ((currentPage - 1) / this.blockPage) * this.blockPage + 1;

        //시작페이지 + 5 -1 을 함으로 1으로 시작하면 5까지 6으로 시작하면 11까지
        this.endPageIndex = this.startPageIndex + this.blockPage - 1;

        //총 페이지는 12페이지인데 1 ~ 5 6 ~ 10 11 12 식으로 보여지기 때문에
        //총 페이지수와 해당 영역의 끝페이지 수를 비교하는 연산이 들어가야함.
        this.endPageIndex = this.endPageIndex > this.pageTotal ? this.pageTotal : this.endPageIndex;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getItemCountPerPage() {
        return itemCountPerPage;
    }

    public int getStart() {
        return start;
    }

    public int getItemCountTotal() {
        return itemCountTotal;
    }

    public int getPageTotal() {
        return pageTotal;
    }

    public int getStartPageIndex() {
        return startPageIndex;
    }

    public int getEndPageIndex() {
        return endPageIndex;
    }

    public int getBlockPage() {
        return blockPage;
    }
}
