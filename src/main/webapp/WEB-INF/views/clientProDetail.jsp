<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="/resources/static/img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>${pro.name }</h2>
					<div class="breadcrumb__option">
						<a href="/">Home</a> <a href="/product?catId=${pro.cat.id }">${pro.cat.name }</a>
						<span>${pro.name }</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<img class="product__details__pic__item--large"
							src="${pro.images.get(0).image }" alt="">
					</div>
					<div class="product__details__pic__slider owl-carousel">
						<c:forEach var="image" items="${pro.images }">
							<img data-imgbigurl="${image.image }" src="${image.image }" alt="">
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3>${pro.name }</h3>
					<div class="product__details__rating">
						<c:forEach begin="1" end="${pro.rating }">
							<i class="fa fa-star"></i>
						</c:forEach>
						<c:forEach begin="${pro.rating+1 }" end="5">
							<i class="fa fa-star-o"></i>
						</c:forEach>
						<span>(${pro.reviews.size() } reviews) (Sold ${pro.sold }
							items) (${pro.userLiked.size() } likes) (${pro.research }
							researches)</span>

					</div>
					<div class="product__details__price">
						<c:if test="${pro.discount>0 }">
							<span class="outer"> <span class="inner">$${pro.price
									}</span>
							</span>
							<span>$${pro.getDiscountPrice() }</span>
						</c:if>
						<c:if test="${pro.discount==0 || pro.discount==null}">
							<span>$${pro.price }</span>
						</c:if>
					</div>
					<c:if test="${pro.quantity>0 }">
						<form action="/auth/addToCart" method="POST">
							<input name="proId" type="hidden" value="${pro.id }">
							<div class="product__details__quantity">
								<div class="quantity">
									<div class="pro-qty-myself">
										<input name="quantity" type="text" value="1">
									</div>
								</div>
							</div>

							<button type="submit" class="primary-btn">ADD TO CART</button>
							<c:if test="${user!=null }">
								<c:if test="${ user.checkProLiked(pro)}">
									<a href="/auth/like?proId=${pro.id }" class="heart-icon"><span
										class="icon_heart"></span></a>
								</c:if>
								<c:if test="${ user.checkProLiked(pro)==false}">
									<a href="/auth/like?proId=${pro.id }" class="heart-icon"><span
										class="icon_heart_alt"></span></a>
								</c:if>
							</c:if>
							<c:if test="${user==null }">
								<a href="/auth/like?proId=${pro.id }" class="heart-icon"><span
									class="icon_heart_alt"></span></a>
							</c:if>
						</form>
					</c:if>
					<h4>Let's Rate us</h4>
					<form method="post" action="/auth/rating">
						<input type="hidden" name="proId" value="${pro.id }" />
						<fieldset class="rating">
							<button class="btn btn-danger">Rate!</button>
							<c:set var="test" value="${ 0}" />
							<c:forEach var="rate" items="${pro.ratings }">
								<c:if test="${rate.user.equals(user) }">
									<c:if test="${(rate.rating==5) }">
										<input type="radio" id="star5" name="rating" value="5" checked />
										<label class="full" for="star5" title="Awesome - 5 stars"></label>
									</c:if>
									<c:if test="${(rate.rating!=5) }">
										<input type="radio" id="star5" name="rating" value="5" />
										<label class="full" for="star5" title="Awesome - 5 stars"></label>
									</c:if>
									<c:if test="${(rate.rating==4) }">
										<input type="radio" id="star4" name="rating" value="4" checked />
										<label class="full" for="star4" title="Pretty good - 4 stars"></label>
									</c:if>
									<c:if test="${(rate.rating!=4 )}">
										<input type="radio" id="star4" name="rating" value="4" />
										<label class="full" for="star4" title="Pretty good - 4 stars"></label>
									</c:if>
									<c:if test="${(rate.rating==3) }">
										<input type="radio" id="star3" name="rating" value="3" checked />
										<label class="full" for="star3" title="Meh - 3 stars"></label>
									</c:if>
									<c:if test="${(rate.rating!=3) }">
										<input type="radio" id="star3" name="rating" value="3" />
										<label class="full" for="star3" title="Meh - 3 stars"></label>
									</c:if>
									<c:if test="${(rate.rating==2) }">
										<input type="radio" id="star2" name="rating" value="2" checked />
										<label class="full" for="star2" title="Kinda bad - 2 stars"></label>
									</c:if>
									<c:if test="${(rate.rating!=2) }">
										<input type="radio" id="star2" name="rating" value="2" />
										<label class="full" for="star2" title="Kinda bad - 2 stars"></label>
									</c:if>
									<c:if test="${(rate.rating==1) }">
										<input type="radio" id="star1" name="rating" value="1" checked />
										<label class="full" for="star1"
											title="Sucks big time - 1 star"></label>
									</c:if>
									<c:if test="${(rate.rating!=1) }">
										<input type="radio" id="star1" name="rating" value="1" />
										<label class="full" for="star1"
											title="Sucks big time - 1 star"></label>
									</c:if>
									<c:set var="test" value="${ 1}" />
								</c:if>
							</c:forEach>
							<c:if test="${test==0 }">
								<input type="radio" id="star5" name="rating" value="5" />
								<label class="full" for="star5" title="Awesome - 5 stars"></label>
								<input type="radio" id="star4" name="rating" value="4" />
								<label class="full" for="star4" title="Pretty good - 4 stars"></label>
								<input type="radio" id="star3" name="rating" value="3" />
								<label class="full" for="star3" title="Meh - 3 stars"></label>
								<input type="radio" id="star2" name="rating" value="2" />
								<label class="full" for="star2" title="Kinda bad - 2 stars"></label>
								<input type="radio" id="star1" name="rating" value="1" />
								<label class="full" for="star1" title="Sucks big time - 1 star"></label>
							</c:if>
						</fieldset>
					</form>
					<ul>
						<li><b>Availability</b> <c:if test="${pro.quantity>1 }">
								<span id="pro_quantity">${pro.quantity }</span> items
							</c:if> <c:if test="${pro.quantity==1 }">
								<span id="pro_quantity">${pro.quantity }</span> item
							</c:if> <c:if test="${pro.quantity==0 }">
								<span id="pro_quantity"><samp>Sold out</samp></span>
							</c:if></li>
						<li><b>Origin</b> <span>${pro.origin }</span></li>
						<!-- <li><b>Share on</b>
							<div class="share">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-instagram"></i></a> <a href="#"><i
									class="fa fa-pinterest"></i></a>
							</div></li> -->
					</ul>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
						</li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-2" role="tab" aria-selected="false">Seller</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-3" role="tab" aria-selected="false">Reviews <span>(${pro.reviews.size() })</span></a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc">
								<p>${pro.description }</p>
							</div>
						</div>
						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="product__details__tab__desc">
								<div class="container-fluid">
									<div class="row">
										<img class="col-xs-1 col-sm-2" src="${pro.user.image }">
										<div class="col-xs-11 col-sm-3">
											<div class="row">
												<div class="col-sm-12">
													<h2>${pro.user.username }</h2>
												</div>
												<div class="col-sm-12">
													<a href="/user/viewShop?username=${pro.user.username }"><button
															class="btn btn-primary">View Shop</button></a>
												</div>
											</div>
										</div>
										<div class="col-xs-11 col-sm-7">
											<div class="row">
												<div class="col-sm-6">
													Products: <span style="color: red">${pro.user.products.size() }</span>
												</div>
												<div class="col-sm-6">
													Attended: <span style="color: red">${pro.user.date}</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="product__details__tab__desc">
								<div class="review-area">
									<c:forEach var="review" items="${pro.reviews }">
										<div class="review-container">
											<img src="${review.user.image }" width="50px" height="50px">
											<div class="review-right product__details__text">
												<div class="review-username">${review.user.username }</div>
												<div class="product__details__rating">
													<c:set var="test" value="${ 0}" />
													<c:forEach var="rate" items="${pro.ratings }">
														<c:if test="${rate.user.equals(review.user) }">
															<c:forEach begin="1" end="${rate.rating }">
																<i class="fa fa-star"></i>
															</c:forEach>
															<c:forEach begin="${rate.rating+1 }" end="5">
																<i class="fa fa-star-o"></i>
															</c:forEach>
															<c:set var="test" value="${ 1}" />
														</c:if>
													</c:forEach>
													<c:if test="${test==0 }">
														<c:forEach begin="1" end="5">
															<i class="fa fa-star-o"></i>
														</c:forEach>
													</c:if>
												</div>
												<c:if test="${!review.image.equals('') }">
													<img height="50px" alt="" src="${review.image }">
												</c:if>
												<div class="comment">${review.review }</div>
											</div>
										</div>
									</c:forEach>
								</div>

								<c:if test="${user!=null }">
									<div class="review-container">
										<img class="img-user" src="${user.image }" width="50px"
											height="50px">
										<div class="review-right">
											<div class="review-username">${user.fullname }</div>
											<div class="review-star">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<form action="/auth/review" method="post"
												enctype="multipart/form-data">
												<input name="proId" value="${pro.id }" type="hidden">
												<input name="username" value="${user.username }"
													type="hidden">
												<textarea name="review" placeholder="Give reviews here"
													rows="4" cols="50"></textarea>
												<div class="form-group">
													<label>Image</label> <input name="file" id="myfile"
														type="file" class="form-control">
												</div>
												<div class="form-group">
													<img id="catImg" src="" alt="" height="200px" />
												</div>
												<div class="review-submit">
													<button class="btn btn-primary">Submit</button>
												</div>
											</form>
										</div>
									</div>
								</c:if>
								<c:if test="${user==null }">
									<p>Login Or Create Account To Review!</p>
									<a href="/login"><button class="btn btn-primary">Login</button></a>
									<a href="/register"><button class="btn btn-danger">Register</button></a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title related__product__title">
					<h2>Related Product</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${relatedPros }" var="item">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="">
							<a href="/product/proDetail?proId=${pro.id }"><img
								src="${item.images.get(0).image }"></a>
							<ul class="product__item__pic__hover">
								<li><a href="/auth/like?proId=${pro.id }"><i
										class="fa fa-heart"></i></a></li>
								<li>
									<form action="/auth/addToCart" method="post">
										<input name="quantity" value="1" type="hidden"> <input
											name="proId" value="${pro.id }" type="hidden"> <a><i
											class="addToCart fa fa-shopping-cart"></i></a>
									</form>
								</li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="/product/proDetail?proId=${item.id }">${item.name }</a>
							</h6>
							<h5>$${item.price }</h5>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<!-- Related Product Section End -->