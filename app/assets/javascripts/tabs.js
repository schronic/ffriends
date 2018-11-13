$(document)
  .find('.nav-tabs:has(.nav-underline)').each(function initialize() {
    const $container = $(this);
    const $active = $container.find('li.active').first();
    const $underline = $container.find('.nav-underline');

    const left = $active.position().left;
    const width = $active.outerWidth();

    $underline.css({left, width});
  });

$(document)
  .on('mouseenter focus', '.nav-tabs:has(.nav-underline) > li > a', function () {
    const $this = $(this);
    const $parent = $this.parent();
    const $container = $parent.closest('.nav-tabs');
    const $underline = $container.find('.nav-underline');

    const left = $parent.position().left;
    const width = $parent.outerWidth();

    $underline.css({left, width});
  })
  .on('mouseleave blur', '.nav-tabs:has(.nav-underline) > li > a', function () {
    const $this = $(this);
    const $container = $this.closest('.nav-tabs');
    const $active = $container.find('li.active').first();
    const $underline = $container.find('.nav-underline');

    const left = $active.position().left;
    const width = $active.outerWidth();

    $underline.css({left, width});
  });
