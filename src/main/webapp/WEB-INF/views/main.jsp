<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<%@include file="includes/header.jsp" %>

<!-- Page Heading -->

<h1 class="mt-4">DASH BOARD</h1>
<div class="card mb-4">
<div class="row">
                            
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                        최근 2주 매출
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                        월 별 매출
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                어제의 매출
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>메뉴</th>
                                                <th>판매 갯수</th>
                                                <th>매출</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>김밥</td>
                                                <td>43 개</td>
                                                <td>43,000</td>
                                            </tr>
                                            <tr>
                                                <td>라면</td>
                                                <td>13 개</td>
                                                <td>39,000</td>
                                            </tr>
                                            <tr>
                                                <td>떡볶이</td>
                                                <td>20 개</td>
                                                <td>80,000</td>
                                            </tr>
                                            <tr>
                                                <td>순대</td>
                                                <td>15 개</td>
                                                <td>30,000</td>
                                            </tr>
                                            <tr>
                                                <td>쥬시쿨</td>
                                                <td>13 개</td>
                                                <td>26,000</td>
                                            </tr>
                                            <tr>
                                                <td>콜라</td>
                                                <td>20 개</td>
                                                <td>80,000</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
<%@include file="includes/footer.jsp" %>

