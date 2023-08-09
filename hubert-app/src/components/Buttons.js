import styled, { css } from 'styled-components';
import { defaultTheme, typeScale } from '../utils';
const Button = styled.button `
  background: transparent;
  border-radius: 3px;
  border: 2px solid ${defaultTheme.primaryColor};
  color: ${defaultTheme.primaryColor};
  cursor: pointer;
  margin: 0 1em;
  padding: 0.25em 1em;
  font-family: ${defaultTheme.primaryFont};
  font-size: ${typeScale.paragraph};
  :hover {
    background: ${defaultTheme.primaryColor};
    color: ${defaultTheme.textColorOnPrimary};
  }
`;


export { Button };
