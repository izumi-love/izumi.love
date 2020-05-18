<template>
  <div class="container" v-if="isMounted">
    <h1
      class="font-sans text-6xl font-light tracking-wider text-gray-600"
      v-bind:class="{ 'vertical-text': isPortrait }"
    >
      イズミラヴ
    </h1>
  </div>
</template>

<script>
export default {
  head () {
    return {
      title: 'イズミラヴ',
      link: [
        {
          rel: 'icon',
          href: 'bxs-heart-fill.svg',
          type: 'image/svg+xml',
        },
      ],
    }
  },
  data: function () {
    return {
      isPortrait: true,   // 縦長(縦向き)
      isLandscape: false, // 横長(横向き)
      isMounted: false,
    }
  },
  mounted () {
    window.addEventListener('resize', this.resizeWindow, false);
    window.addEventListener('orientationchange', this.resizeWindow, false);
    this.resizeWindow();
    this.isMounted = true
  },
  methods: {
    resizeWindow () {
      let width = window.innerWidth;
      let height = window.innerHeight;
      this.isPortrait = (width <= height);
      this.isLandscape = (width >= height);
    },
  },
  beforeDestroy: function () {
    window.removeEventListener('resize', this.resizeWindow, false);
    window.removeEventListener('orientationchange', this.resizeWindow, false);
  },
}
</script>

<style scoped>
.container {
  @apply min-h-screen flex justify-center items-center text-center mx-auto;
}

.vertical-text {
  writing-mode: vertical-rl;
  text-orientation: upright;
}
</style>
