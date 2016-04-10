<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>我们</title>

		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap-pingendo.css" />
		<link rel="stylesheet" type="text/css" href="<%=path%>/css/LongYeh-main.css" />
		<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
		<style type="text/css">
			#our-content {
				background-color: rgba(255, 255, 255, 0.1);

				border-radius: 2px;
				overflow: auto;
			}
			#our-intro {
				margin: 0 30px;
				background-color: rgba(255, 255, 255, 0.3);
				/*border: 1px solid gainsboro;*/

				border-radius: 2px;
				overflow: auto;
				
			}
			pre{
				background: linear-gradient(rgba(255, 255, 255, 0.01), rgba(255, 255, 255, 0.5));
				font-family: 文泉驿微米黑;
				border: none;
				border-radius: none;
				font: 1em;
			}
		</style>
	</head>

	<body>
		<div class="navbar navbar-default navbar-fixed-bottom section-white" id="nav-bottom">
			<div class="row">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="navbar-brand">
						<a href="index-maindemo.html"><i class="icon-home"></i></a>&nbsp;&nbsp;&nbsp;主页
					</div>
				</div>
				<div class="collapse navbar-collapse" id="navbar-ex-collapse">
					<ul class="nav navbar-nav navbar-right">
						<div class="row">
							<!-- 一级菜单开始   -->
							<div class="col-md-12 hidden-xm hidden-xs">
								<a href="#Blog" data-toggle="tab">
									<div class="btn btn-m section-white ">
										我们的博客
									</div>
								</a>
								<a href="#Members " data-toggle="tab">
									<div class="btn btn-m section-white ">
										我们的成员
									</div>
								</a>
								<a href="#Technicals " data-toggle="tab">
									<div class="btn btn-m section-white">
										追过的技术
									</div>
								</a>
								<a href="#LazyBox " data-toggle="tab">
									<div class="btn btn-m section-white">
										功能的盒子
									</div>
								</a>
							</div>
							<!-- 一级菜单结束   -->

						</div>

						<li class="visible-xs ">
							<a href="#Blog" data-toggle="tab">
									我们的博客
								</a>
						</li>
						<li class="visible-xs ">
							<a href="#Members " data-toggle="tab">
									我们的成员
								</a>
						</li>
						<li class="visible-xs ">
							<a href="#Technicals " data-toggle="tab">
									追过的技术
								</a>
						</li>

					</ul>
				</div>
			</div>
		</div>

		<div class="cover" id="our-cover">
			<div class="cover-image" style="background-image: url('<%=path%>/images/sunshine-flowers.jpg')"></div>
			<div class="row" id="our-windows">

				<div class="col-md-12 row" id="our-content">
					<div class="col-md-8">
						<div id="ourHome" class="tab-content  ">
							<div class="tab-pane fade in active " id="Blog">
								<div class="section">
									<h1>Time after Time</h1>
									<pre>如果还能再次与你相遇 绝对不再放开你的手
告知春天将尽 花与果实 以及雾花一片
在我心中苏醒而忆起的歌曲 现在依然是如此的优美

Time after time 与你相遇的奇迹
在那微风缓缓吹过的街道
悄悄的牵着手 一起走过的坡道
直到如今也没有忘记的约定
风中可以听到你的声音 如薄冰般寒冷遥远的记忆
曾经发誓过决不知晓受伤的恐怖
何时还能再一次 在这同样的地方
在薄红色季节的日子来临的时候
带着笑容再一次相遇吧

Time after time 一个人在花瓣漫舞的街道
虽然散落之时无法再次挽回
与那一天同样不曾改变的景致 泪水也轻轻的落下喔
如随风飘舞的花瓣抚平水面一般
珍贵的回忆是如此的难过
虽说人都是孤独的 因此而不找寻想念的某个人
我不要这样 净是追求虚幻但容易毁坏的东西

Time after time
如果在樱花染粉的街道再次与你相遇
再也不要任何约定
这一次一定要 陪在比谁都容易受伤的你身边</pre>

								</div>
							</div>
							<div class="tab-pane fade in  " id="Members"><h1>Hello World !</h1></div>
							<div class="tab-pane fade in  " id="Technicals"><h1>哈哈^_^~</h1></div>
							<div class="tab-pane fade in  " id="LazyBox"><h1>空空荡荡~~空空荡荡</h1></div>
						</div>
					</div>
					<div class="col-md-4">

					</div>

				</div>

			</div>
		</div>
		<footer class="" style="color:#000;" hidden="hidden">
			<div class="row">
				<div class="col-md-12">
					<h5 class="page-header">
						<span class="text-muted">
                            <strong>Copyright © 2015 ● 河南大学软件学院</strong>
                        </span>
                	</h5>
					<div class="row placeholders">
						<div class="col-md-4 placeholder">
							<h4>关于我们</h4>
							<span class="text-muted">我们的主页:</span>
							<span class="text-muted">
                            <a href="index-us.html">LongYeh</a>
                        </span>
						</div>

						<div class="col-md-4 placeholder">
							<h4>Feedback</h4>
							<span class="text-muted">Email:
                            <a href="mailto:llgtgx1@hotmail.com">llgtgx1@hotmail.com</a>
                        </span>
							<br>
							<span class="text-muted">帮助:
                            <a href="#">帮助文档</a>
                        </span>
						</div>

						<div class="col-md-4 placeholder">
							<h4>地址</h4>
							<span class="text-muted">开封市 金明区金明大道</span>
							<br />
							<br />

						</div>
					</div>
				</div>
			</div>
			<br />
			<br />
			<br />
			<hr />
		</footer>

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>

		<script src="plugin/bootstrap-wysiwyg/external/jquery.hotkeys.js"></script>
		<script src="plugin/bootstrap-wysiwyg/bootstrap-wysiwyg.js"></script>
		<script type="text/javascript">
			$(function() {
				var ourCover = $("#our-cover").height();
				var ourCoverWidth = $("#our-cover").width();
				var ourWindows = 0.8 * ourCover;
				$("#our-windows").height(ourWindows);
				$("#our-windows").width(ourCoverWidth);
				var navBottom = $("#nav-bottom").height(); //底栏高度
				var ourContent = ourWindows - navBottom;
				$("#our-content").height(ourContent); //计算出 左侧内容高度
			});
		</script>
	</body>

</html>