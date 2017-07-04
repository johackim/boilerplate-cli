#!/usr/bin/env node

import 'babel-polyfill';
import debug from 'debug';

const log = debug('all');

log('Hello debug');
console.log('Hello world');
