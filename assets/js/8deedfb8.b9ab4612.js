"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[556],{3905:(e,t,n)=>{n.d(t,{Zo:()=>p,kt:()=>s});var l=n(67294);function a(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function r(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);t&&(l=l.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,l)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?r(Object(n),!0).forEach((function(t){a(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):r(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function o(e,t){if(null==e)return{};var n,l,a=function(e,t){if(null==e)return{};var n,l,a={},r=Object.keys(e);for(l=0;l<r.length;l++)n=r[l],t.indexOf(n)>=0||(a[n]=e[n]);return a}(e,t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);for(l=0;l<r.length;l++)n=r[l],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(a[n]=e[n])}return a}var d=l.createContext({}),u=function(e){var t=l.useContext(d),n=t;return e&&(n="function"==typeof e?e(t):i(i({},t),e)),n},p=function(e){var t=u(e.components);return l.createElement(d.Provider,{value:t},e.children)},m="mdxType",c={inlineCode:"code",wrapper:function(e){var t=e.children;return l.createElement(l.Fragment,{},t)}},k=l.forwardRef((function(e,t){var n=e.components,a=e.mdxType,r=e.originalType,d=e.parentName,p=o(e,["components","mdxType","originalType","parentName"]),m=u(n),k=a,s=m["".concat(d,".").concat(k)]||m[k]||c[k]||r;return n?l.createElement(s,i(i({ref:t},p),{},{components:n})):l.createElement(s,i({ref:t},p))}));function s(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var r=n.length,i=new Array(r);i[0]=k;var o={};for(var d in t)hasOwnProperty.call(t,d)&&(o[d]=t[d]);o.originalType=e,o[m]="string"==typeof e?e:a,i[1]=o;for(var u=2;u<r;u++)i[u]=n[u];return l.createElement.apply(null,i)}return l.createElement.apply(null,n)}k.displayName="MDXCreateElement"},26437:(e,t,n)=>{n.r(t),n.d(t,{contentTitle:()=>i,default:()=>m,frontMatter:()=>r,metadata:()=>o,toc:()=>d});var l=n(87462),a=(n(67294),n(3905));const r={},i=void 0,o={type:"mdx",permalink:"/immut/CHANGELOG",source:"@site/pages/CHANGELOG.md",description:"0.4.4",frontMatter:{}},d=[{value:"0.4.4",id:"044",level:2},{value:"0.4.3",id:"043",level:2},{value:"0.4.2",id:"042",level:2},{value:"0.4.1",id:"041",level:2},{value:"0.4.0",id:"040",level:2},{value:"0.3.2",id:"032",level:2},{value:"0.3.1",id:"031",level:2},{value:"0.3.0",id:"030",level:2},{value:"0.2.1",id:"021",level:2},{value:"0.2.0",id:"020",level:2},{value:"0.1.0",id:"010",level:2}],u={toc:d},p="wrapper";function m(e){let{components:t,...n}=e;return(0,a.kt)(p,(0,l.Z)({},u,n,{components:t,mdxType:"MDXLayout"}),(0,a.kt)("h2",{id:"044"},"0.4.4"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"Fixed ",(0,a.kt)("inlineCode",{parentName:"li"},"finishDraft")," mutating non-draft tables")),(0,a.kt)("h2",{id:"043"},"0.4.3"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"Added ",(0,a.kt)("inlineCode",{parentName:"li"},"makeDraftSafeReadOnly")),(0,a.kt)("li",{parentName:"ul"},"Added ",(0,a.kt)("inlineCode",{parentName:"li"},"table.find")),(0,a.kt)("li",{parentName:"ul"},"Added ",(0,a.kt)("inlineCode",{parentName:"li"},"table.concat"))),(0,a.kt)("h2",{id:"042"},"0.4.2"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},(0,a.kt)("inlineCode",{parentName:"li"},"produce")," now allows all values except tables with metatables as a base")),(0,a.kt)("h2",{id:"041"},"0.4.1"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"Added ",(0,a.kt)("inlineCode",{parentName:"li"},"nothing")," as an alias for ",(0,a.kt)("inlineCode",{parentName:"li"},"None"))),(0,a.kt)("h2",{id:"040"},"0.4.0"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"All table library replacement functions can now use non-draft tables"),(0,a.kt)("li",{parentName:"ul"},"Table library is now found under ",(0,a.kt)("inlineCode",{parentName:"li"},"Immut.table")),(0,a.kt)("li",{parentName:"ul"},"Added ",(0,a.kt)("inlineCode",{parentName:"li"},"table.sort")),(0,a.kt)("li",{parentName:"ul"},"Added ",(0,a.kt)("inlineCode",{parentName:"li"},"table.clear")),(0,a.kt)("li",{parentName:"ul"},"Added ",(0,a.kt)("inlineCode",{parentName:"li"},"makeDraftSafe")),(0,a.kt)("li",{parentName:"ul"},"Fixed Draft iterator not returning drafted versions of nested tables"),(0,a.kt)("li",{parentName:"ul"},(0,a.kt)("inlineCode",{parentName:"li"},"produce")," will now finalize any drafts found in non-draft table return values"),(0,a.kt)("li",{parentName:"ul"},"Added ",(0,a.kt)("inlineCode",{parentName:"li"},"None"))),(0,a.kt)("h2",{id:"032"},"0.3.2"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},(0,a.kt)("inlineCode",{parentName:"li"},"insert")," will no longer error when not providing a position")),(0,a.kt)("h2",{id:"031"},"0.3.1"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"Fixed ",(0,a.kt)("inlineCode",{parentName:"li"},"remove")," causing an error when required")),(0,a.kt)("h2",{id:"030"},"0.3.0"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"Added documentation"),(0,a.kt)("li",{parentName:"ul"},"Added ",(0,a.kt)("inlineCode",{parentName:"li"},"remove")," and ",(0,a.kt)("inlineCode",{parentName:"li"},"insert")," for use with drafts that are lists."),(0,a.kt)("li",{parentName:"ul"},"The ",(0,a.kt)("inlineCode",{parentName:"li"},"#")," operator will now work on drafts that are lists.")),(0,a.kt)("h2",{id:"021"},"0.2.1"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"Added ",(0,a.kt)("inlineCode",{parentName:"li"},"isDraftable"))),(0,a.kt)("h2",{id:"020"},"0.2.0"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"Added ",(0,a.kt)("inlineCode",{parentName:"li"},"original")," and ",(0,a.kt)("inlineCode",{parentName:"li"},"current")),(0,a.kt)("li",{parentName:"ul"},"Exposed some of the internals of Immut for advanced users.",(0,a.kt)("ul",{parentName:"li"},(0,a.kt)("li",{parentName:"ul"},(0,a.kt)("inlineCode",{parentName:"li"},"createDraft")),(0,a.kt)("li",{parentName:"ul"},(0,a.kt)("inlineCode",{parentName:"li"},"finishDraft")),(0,a.kt)("li",{parentName:"ul"},(0,a.kt)("inlineCode",{parentName:"li"},"isDraft"))))),(0,a.kt)("h2",{id:"010"},"0.1.0"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"Initial release")))}m.isMDXComponent=!0}}]);