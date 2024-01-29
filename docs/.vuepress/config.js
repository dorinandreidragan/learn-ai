import { defaultTheme } from '@vuepress/theme-default'
import { viteBundler } from '@vuepress/bundler-vite'
import { backlogSidebar } from './backlog-sidebar'

export default ({ 
    lang: 'en-us',
    title: 'My Journey to AI',

    bundler: viteBundler({
        viteOptions: {
            build: {
                rollupOptions: {
                    output: {
                        manualChunks: false,
                        inlineDynamicImports: true,
                        entryFileNames: '[name].js',
                        assetFileNames: '[name].[ext]'
                    }
                }
            }
        }
    }),

    theme: defaultTheme({
        logo: '/images/ai_logo.jpg',
        sidebar: [
            '/overview.md',
            {
                text: 'Neural Networks',
                link: '/neural-networks/',
                children: [
                    '/neural-networks/perceptron.md',
                ]
            },
            '/backlog.md',
        ],
        plugins: [
            'vuepress-plugin-mathjax',
            {
                target: 'svg',
                macros: {
                    '*': '\\times',
                }
            }
        ]
    }),
})

