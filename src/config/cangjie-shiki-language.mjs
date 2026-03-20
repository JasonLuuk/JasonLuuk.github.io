const cangjieShikiLanguage = {
  name: 'cangjie',
  displayName: 'Cangjie',
  scopeName: 'source.cangjie',
  aliases: ['cj'],
  fileTypes: ['cj'],
  patterns: [
    { include: '#comments' },
    { include: '#strings' },
    { include: '#numbers' },
    { include: '#keywords' },
    { include: '#types' },
    { include: '#constants' },
    { include: '#functions' },
    { include: '#operators' },
  ],
  repository: {
    comments: {
      patterns: [
        {
          name: 'comment.line.double-slash.cangjie',
          match: '//.*$',
        },
        {
          name: 'comment.block.cangjie',
          begin: '/\\*',
          end: '\\*/',
        },
      ],
    },
    strings: {
      patterns: [
        {
          name: 'string.quoted.double.cangjie',
          begin: '"',
          end: '"',
          patterns: [
            {
              name: 'constant.character.escape.cangjie',
              match: '\\\\.',
            },
          ],
        },
        {
          name: 'string.quoted.single.cangjie',
          begin: "'",
          end: "'",
          patterns: [
            {
              name: 'constant.character.escape.cangjie',
              match: '\\\\.',
            },
          ],
        },
      ],
    },
    numbers: {
      patterns: [
        {
          name: 'constant.numeric.cangjie',
          match:
            '\\b(?:0[xX][0-9a-fA-F_]+|0[bB][01_]+|0[oO][0-7_]+|(?:\\d[\\d_]*)(?:\\.\\d[\\d_]*)?(?:[eE][+\\-]?\\d[\\d_]*)?)\\b',
        },
      ],
    },
    keywords: {
      patterns: [
        {
          name: 'keyword.control.cangjie',
          match:
            '\\b(?:if|else|for|while|match|case|try|catch|finally|throw|break|continue|return|in|where)\\b',
        },
        {
          name: 'storage.type.cangjie',
          match:
            '\\b(?:class|interface|enum|struct|func|main|let|var|operator|extend|override|import|package|public|private|protected|internal|abstract|open|sealed|static)\\b',
        },
        {
          name: 'keyword.other.effects.cangjie',
          match: '\\b(?:perform|handle|resume|with)\\b',
        },
      ],
    },
    types: {
      patterns: [
        {
          name: 'support.type.builtin.cangjie',
          match:
            '\\b(?:Bool|Rune|String|Unit|Any|Nothing|Int8|Int16|Int32|Int64|IntNative|UInt8|UInt16|UInt32|UInt64|UIntNative|Float16|Float32|Float64|Array|Range|Option|Result)\\b',
        },
      ],
    },
    constants: {
      patterns: [
        {
          name: 'constant.language.cangjie',
          match: '\\b(?:true|false|null)\\b',
        },
      ],
    },
    functions: {
      patterns: [
        {
          name: 'entity.name.function.cangjie',
          match: '\\b[a-zA-Z_][a-zA-Z0-9_]*(?=\\s*\\()',
        },
      ],
    },
    operators: {
      patterns: [
        {
          name: 'keyword.operator.cangjie',
          match: '(?:==|!=|<=|>=|&&|\\|\\||[+\\-*/%<>=!&|^~?:])',
        },
      ],
    },
  },
};

export default cangjieShikiLanguage;
