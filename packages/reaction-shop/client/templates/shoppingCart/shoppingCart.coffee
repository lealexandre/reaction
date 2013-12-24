Template.shopCartIcon.helpers
  cartCount: ->
    count = 0
    if Session.get('serverSession')
      currentCart = Cart.findOne()
    if currentCart and currentCart.items
      for items in currentCart.items
        count += items.quantity
    return count

Template.shopCartIconList.helpers
  cartList: ->
    currentCart = Cart.findOne()
    if currentCart
      return currentCart.items


Template.shopCartSlide.helpers
  cartItems: ->
    currentCart = Cart.findOne()
    if currentCart
      return currentCart.items

  image:(variantId)->
    variants = Products.findOne({"variants._id":variantId},{fields:{"variants":true}}).variants
    variant = _.filter(variants, (item)-> item._id is variantId)

    if variant[0].medias and variant[0].medias[0].src?
      variant[0].medias[0].src
    else
      variants[0].medias[0].src

Template.shopCartSlide.rendered = ->
  $(".owl-carousel").owlCarousel
    items: 5
    lazyLoad : true
    itemsDesktop: [1199, 3]
    itemsDesktopSmall: [979, 3]

Template.shopCartSlide.events
  'click #btn-checkout': () ->
    $("#shop-cart-slide").fadeOut( 100 )