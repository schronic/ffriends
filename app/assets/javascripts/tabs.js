$(document)
  .find('.nav-tabs:has(.nav-underline)').each(function initialize() {
    var $container = $(this);
    var $active = $container.find('li.active').first();
    var $underline = $container.find('.nav-underline');

    var left = $active.position().left;
    var width = $active.outerWidth();

    $underline.css({left, width});
  });

$(document)
  .on('mouseenter focus', '.nav-tabs:has(.nav-underline) > li > a', function () {
    var $this = $(this);
    var $parent = $this.parent();
    var $container = $parent.closest('.nav-tabs');
    var $underline = $container.find('.nav-underline');

    var left = $parent.position().left;
    var width = $parent.outerWidth();

    $underline.css({left, width});
  })
  .on('mouseleave blur', '.nav-tabs:has(.nav-underline) > li > a', function () {
    var $this = $(this);
    var $container = $this.closest('.nav-tabs');
    var $active = $container.find('li.active').first();
    var $underline = $container.find('.nav-underline');

    var left = $active.position().left;
    var width = $active.outerWidth();

    $underline.css({left, width});
  });
