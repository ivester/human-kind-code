// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: ['@nuxt/eslint'],
  devtools: {
    enabled: true, // Enable Nuxt Devtools
    timeline: {
      enabled: true,
    },
  },
  compatibilityDate: '2024-04-03',
  typescript: {
    typeCheck: true, // Enable type checking on npm run build/dev
  },
  eslint: {
    config: {
      stylistic: true, // Enable stylistic rules - alternative to prettier
    },
  },
})
